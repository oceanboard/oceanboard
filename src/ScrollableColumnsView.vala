public class ScrollableColumnsView : Gtk.ScrolledWindow {
    //                               ^ Gonna extend from scrolled window

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

    // Creates a new column and adds it to the window
    // with a label
    public Gtk.ListBox new_column_with_label(string label) {
        return new_column_with_frame(label);
    }

    // This method adds a ListBox with a Frame around it,
    // giving it a nice border.
    private Gtk.ListBox new_column_with_frame(string label) {
        var col = new Gtk.ListBox();
        col.selection_mode = Gtk.SelectionMode.BROWSE;

        var frame = new Gtk.Frame(label);
        frame.add(col);
        
        columns.pack_start(frame);
        return col;
    }
}