public class MainWindow : Gtk.ApplicationWindow {
    private HeaderBar headerBar;

    public MainWindow (Gtk.Application application) {
        Object (
            application: application,
            height_request: 600,
            width_request: 800
        );
    }

    construct {
        headerBar = new HeaderBar ();
        set_titlebar (headerBar);
    }
}