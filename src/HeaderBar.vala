
public class HeaderBar : Gtk.HeaderBar {

    // Static names for menu options
    public const string ACTION_NEW = "New";
    public const string ACTION_EDIT = "Edit";

    public HeaderBar() {
        Object(
            show_close_button: true,
            custom_title: new Gtk.Grid()
        );
    }

    construct {
        var new_button = new Gtk.Button();
        new_button.halign = Gtk.Align.START;
        new_button.label = ACTION_NEW;

        var edit_button = new Gtk.Button();
        edit_button.halign = Gtk.Align.START;
        edit_button.label = ACTION_EDIT;

        pack_start(new_button);
        pack_start(edit_button);
    }
}