
namespace ZzzServer.Widgets{

    public class HeaderBar : Gtk.HeaderBar{

        public Gtk.Button _back_button;
        public Gtk.Button back_button 
        { 
            get{
                return this._back_button;
            } 
            set{
                if(this._back_button != null)
                    base.remove(this._back_button);

                this._back_button = value;
                base.pack_start(_back_button);
            } 
        }

        public HeaderBar(){
            Object(
                custom_title: new Gtk.Label("zZzerver"),
                show_close_button: true
            );

        }

        construct{
            base.get_style_context().add_class("");
        }


    }


}
