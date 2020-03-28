public class ScrollableColumnsView : Gtk.ScrolledWindow {
    private Gtk.Box columns;
    construct {
        columns = new Gtk.Box(Gtk.Orientation.HORIZONTAL, 50);
        add(columns);
    }

    public void add_label(string label) {
        columns.pack_start(new Gtk.Label(label));
    }

    public void add_column_with_label(string label) {
        var col = new Gtk.ListBox();
        col.add(new Gtk.Label(label));
        columns.pack_start(col);
    }
    public Gtk.Box get_columns() {
        return columns;
    }
}