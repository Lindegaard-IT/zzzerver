//zZzerver: The simple server management client
//    Copyright (C) 2020  Rasmus Lindegaard

using Gee;

namespace ZzzServer.Widgets{

    public class HistoryStack : Gtk.Stack {

        public Gtk.Widget _sub_page;
        public Gtk.Widget sub_page { 
            get{
                return this._sub_page;
            } 
            set{
                if(value == null && _sub_page != null){
                    base.remove(this._sub_page);
                    this._sub_page = null;
                }else if(value != visible_child){
                    this.previous.add(this.visible_child);
                    this._sub_page = value;
                    add(this._sub_page);
                    this.sub_page.show_all();//base.show_all();
                    visible_child = this._sub_page;
                    this.back_button.show();
                }
            }
        }

        public Gtk.Button back_button { get; private set; }
        private Gee.List<Gtk.Widget> previous;

        public HistoryStack(){

            this.previous = new LinkedList<Gtk.Widget>();

        }

        construct{
            base.set_transition_type(Gtk.StackTransitionType.SLIDE_LEFT_RIGHT);
            base.set_transition_duration(200);
            this.back_button = new Gtk.Button.with_label("Back");
            this.back_button.get_style_context().add_class("back-button");
            this.back_button.clicked.connect(back);
        }

        public void back(){

            var prev_widget = this.previous.last();
            this.previous.remove(prev_widget);

            var current_widget = visible_child;

            base.set_visible_child(prev_widget);
            this.sub_page = null;
            if(this.previous.size == 0)
                this.back_button.visible = false;
        }


    }

}
