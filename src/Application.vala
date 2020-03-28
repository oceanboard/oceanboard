
public class App: Gtk.Application  {

    public App () {
        Object (
            application_id: "com.github.oceanboard.app",
            flags: ApplicationFlags.FLAGS_NONE
        );
    }

    protected override void activate () {
        ScrollableColumnsView cols = new ScrollableColumnsView();

        var main_window = new Gtk.ApplicationWindow (this);
        cols.add_column_with_label("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
        cols.add_column_with_label("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
        cols.add_column_with_label("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
        cols.add_column_with_label("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
        cols.add_column_with_label("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
        cols.add_column_with_label("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
        cols.add_column_with_label("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
        cols.add_column_with_label("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
        cols.add_column_with_label("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");


        //  Gtk.StyleContext.add_provider_for_screen (main_window.get_screen (), css_provider, Gtk.STYLE_PROVIDER_PRIORITY_USER);
        main_window.default_height = 600;
        main_window.default_width = 900;
        main_window.resizable = false;
        main_window.title = "Oceanboard";
        main_window.add (cols);
        main_window.show_all ();
    }

    public static int main (string[] args) {
        var app = new App ();
        return app.run (args);
    }
}
