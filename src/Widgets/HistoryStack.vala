//zZzerver: The simple server management client
//    Copyright (C) 2020  Rasmus Lindegaard

using Gee;

namespace ZzzServer.Widgets{

    public class HistoryStack : Gtk.Stack {

        protected Gtk.Widget _sub_page;
        public Gtk.Widget sub_page { 
            get{
                return this._sub_page;
            } 
            set{
                if(value == null && _sub_page != null){
                    base.remove(this._sub_page);
                    this._sub_page = null;
                }else if(value != visible_child){
                    if(visible_child != this.base_page){
                        this.previous.add(this.visible_child);
                    }
                    this._sub_page = value;
                    base.add(this._sub_page);
                    this.sub_page.show_all();//base.show_all();
                    visible_child = this._sub_page;
                    this.back_button.show();
                }
            }
        }

        private Gtk.Widget _base_page;
        public Gtk.Widget base_page { 
            get{
                return this._base_page;
            }
            set{
                if(value != this._base_page){
                    base.add(value);
                    if(this._base_page != null){
                        if(visible_child == this._base_page){
                            base.transition_type = Gtk.StackTransitionType.CROSSFADE;
                        }

                        base.remove(this._base_page);
                    }
                }
                this._base_page = value;
                base.visible_child = value;
                base.transition_type = Gtk.StackTransitionType.SLIDE_LEFT_RIGHT;
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

            Gtk.Widget prev_widget;
            if(this.previous.size > 0){
                prev_widget = this.previous.last();
                this.previous.remove(prev_widget);
            }else{
                this.back_button.hide();
                prev_widget = this.base_page;
            }

            var current_widget = visible_child;

            this._sub_page = prev_widget;
            base.set_visible_child(prev_widget);

            base.remove(current_widget);
        }


    }

}
