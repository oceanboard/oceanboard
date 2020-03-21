
public class App: Gtk.Application  {
    private Gtk.SearchEntry search_entry { get; set; }
    private Gtk.Grid grid { get; set; }
    private Gtk.Label current_temp { get; set; }
    public App () {
        Object (
            application_id: "com.github.jorgemanzo.app",
            flags: ApplicationFlags.FLAGS_NONE
        );
    }
    protected override void activate () {
        grid = new Gtk.Grid ();
        grid.orientation = Gtk.Orientation.VERTICAL;
        grid.margin_start = 10;
        grid.margin_top = 10;
        grid.row_spacing = 10;
        grid.column_spacing = 4;
        
        search_entry = new Gtk.SearchEntry ();
        var search_button = new Gtk.Button.with_label ("Go");
        search_button.clicked.connect (() => {
            Json.Node res = Api.weather_by_query (search_entry.get_text ());
            string temp = Api.get_temp(res).to_string ();
            current_temp.set_text (@"$temp °F");
        });

        grid.attach (search_entry, 0, 0, 3, 1);
        grid.attach_next_to (search_button, search_entry, Gtk.PositionType.RIGHT, 1, 1);

        var css_provider = new Gtk.CssProvider ();
        try{ 
            css_provider.load_from_path ("../style.css"); 
        } catch (Error e) {
            print ("Something bad happened: %s\n", e.message);
        }

        current_temp = new Gtk.Label ("");
        current_temp.set_text ("-- °F");
        current_temp.get_style_context ().add_class ("temp");
        grid.attach (current_temp, 0, 1, 4, 5);

        var main_window = new Gtk.ApplicationWindow (this);
        Gtk.StyleContext.add_provider_for_screen (main_window.get_screen (), css_provider, Gtk.STYLE_PROVIDER_PRIORITY_USER);
        main_window.default_height = 300;
        main_window.default_width = 300;
        main_window.resizable = false;
        main_window.title = "App";
        main_window.add (grid);
        main_window.show_all ();
    }
    public static int main (string[] args) {
        //  string api = "http://api.openweathermap.org/data/2.5/weather?q=97331&appid=c442835085b1b44e5f24c2702797b2bb";
        //  Json.Node res = Api.fetch(api);
        var app = new App ();
        return app.run (args);
    }
}
