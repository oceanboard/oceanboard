public class Card : Gtk.Frame {
    private Gtk.TextView textView;
    
    public Card.withContent(string content) {
        var tb = new Gtk.TextBuffer(null);
        textView = new Gtk.TextView.with_buffer(tb);
        tb.set_text(content, content.length);
        textView.set_buffer(tb);
        textView.set_editable(false);
        textView.set_cursor_visible(false);
        add(textView);
    }
    
    public void setContent(string newContent) {
        textView.get_buffer().set_text(newContent);
    }
    
    public void set_editable(bool isEditable) {
        textView.set_editable(isEditable);
    }
}
