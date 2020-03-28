
public class App: Gtk.Application  {

    // So we have access to and labels for each column
    Gee.HashMap<string, Gtk.ListBox> columns;

    // This object wraps around scrolled window and gives us
    // a way to add columns.
    ScrollableColumnsView view;

    public App () {
        Object (
            application_id: "com.github.oceanboard.app",
            flags: ApplicationFlags.FLAGS_NONE
        );
    }

    protected override void activate () {
        view = new ScrollableColumnsView();
        columns = new Gee.HashMap<string, Gtk.ListBox>();

        var col1 = "Column 1";
        var col2 = "Column 2";
        var col3 = "Column 3";
        var col4 = "Column 4";

        var long_text = "loooooooooooooooooooooooooooong text";

        // Make some columns
        columns.set(col1, view.new_column());
        columns.set(col2, view.new_column());

        // These are more special in that they have a frame around each col
        columns.set(col3, view.new_column_with_label(col3));
        columns.set(col4, view.new_column_with_label(col4));

        // Add items to every column
        columns.get(col1).add(new Gtk.Label(long_text));
        columns.get(col2).add(new Gtk.Label(long_text));
        columns.get(col3).add(new Gtk.Label(long_text));
        columns.get(col3).add(new Gtk.Label(long_text));
        columns.get(col3).add(new Gtk.Label(long_text));
        columns.get(col3).add(new Gtk.Label(long_text));
        columns.get(col4).add(new Gtk.Label(long_text));
        columns.get(col4).add(new Gtk.Label(long_text));
        columns.get(col4).add(new Gtk.Label(long_text));
        columns.get(col4).add(new Gtk.Label(long_text));
        columns.get(col4).add(new Gtk.Label(long_text));

        var main_window = new Gtk.ApplicationWindow (this);
        main_window.default_height = 600;
        main_window.default_width = 900;
        main_window.resizable = true;
        main_window.title = "Oceanboard";
        main_window.add (view);
        main_window.show_all ();
    }

    public static int main (string[] args) {
        var app = new App ();
        return app.run (args);
    }
}
