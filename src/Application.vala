
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

    protected override void activate() {

        var main_window = new MainWindow (this);
        main_window.resizable = true;
        main_window.title = "Oceanboard";
        
        view = new ScrollableColumnsView();
        columns = new Gee.HashMap<string, Gtk.ListBox>();

        var col1 = "My Column";
        var col2 = "My Second Column";
        var multiLineText = "
        \tMulti Line Text!\n
        Here is some multi-line text:\n
        1. aa\n
        2. aaA\n
        3. AAAA\n
        ";
        var card = new Card.withContent(multiLineText);
        var card2 = new Card.withContent(multiLineText);
        var card3 = new Card.withContent(multiLineText);



        // Make some columns
        columns.set(col1, view.new_column_with_label(col1));
        columns.set(col2, view.new_column_with_label(col2));

        // Add some items
        columns.get(col1).add(new Gtk.Label("Column 1 item"));
        columns.get(col2).add(new Gtk.Label("Column 2 item"));
        columns.get(col2).add(card2);
        columns.get(col2).add(card3);


        columns.get(col1).add(card);
        columns.get(col1).add(new Gtk.Label("Column 1 item 2"));


        main_window.add (view);
        main_window.show_all ();
        
    }

    public static int main (string[] args) {
        var app = new App ();
        return app.run (args);
    }
}
