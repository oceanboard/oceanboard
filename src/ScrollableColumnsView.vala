public class ScrollableColumnsView : Gtk.ScrolledWindow {

    // Using Gtk.Box lets us easily add items to it, and
    // they will placed as columns horizontally
    private Gtk.Box columns;
    construct {
        // 50 px of spacing between each column
        columns = new Gtk.Box(Gtk.Orientation.HORIZONTAL, 50);

        // Add the Gtk.Box to the Gtk.ScrolledWindow to
        // give us H-scrolling
        add(columns);
    }

    // Creates a new column and adds it to the window,
    // and returns the created column.
    public Gtk.ListBox new_column() {
        var col = new Gtk.ListBox();
        columns.pack_start(col);
        return col;
    }
}