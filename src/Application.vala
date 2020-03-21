
public class App: Gtk.Application  {
    private Gtk.SearchEntry search_entry { get; set; }
    private Gtk.Grid grid { get; set; }
    private Gtk.Label current_temp { get; set; }
    
    public App () {
        Object (
            application_id: "com.github.oceanboard.app",
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

        var column = new Gtk.ListBox();
        column.set_selection_mode(Gtk.SelectionMode.NONE);
        
        var testBox1 = new Gtk.Box(Gtk.Orientation.HORIZONTAL, 10);
        var label1 = new Gtk.Label("Test Box 1");
        testBox1.pack_start(label1, true, true, 0);
        column.add(testBox1);

        var testBox2 = new Gtk.Box(Gtk.Orientation.HORIZONTAL, 10);
        var label2 = new Gtk.Label("Test Box 2");
        testBox2.pack_start(label2, true, true, 0);
        column.add(testBox2);

        grid.attach(column, 0, 0, 10, 10);

        var css_provider = new Gtk.CssProvider ();
        try{ 
            css_provider.load_from_path ("../style.css"); 
        } catch (Error e) {
            print ("Something bad happened: %s\n", e.message);
        }

        var main_window = new Gtk.ApplicationWindow (this);
        Gtk.StyleContext.add_provider_for_screen (main_window.get_screen (), css_provider, Gtk.STYLE_PROVIDER_PRIORITY_USER);
        main_window.default_height = 600;
        main_window.default_width = 900;
        main_window.resizable = false;
        main_window.title = "Oceanboard";
        main_window.add (grid);
        main_window.show_all ();
    }

    public static int main (string[] args) {
        var app = new App ();
        return app.run (args);
    }
}
