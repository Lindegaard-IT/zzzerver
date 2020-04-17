//zZzerver: The simple server management client
//    Copyright (C) 2020  Rasmus Lindegaard

using ZzzServer.Models;
using ZzzServer.Widgets;

namespace ZzzServer.Widgets.Main{

    public class DefaultServerRow : Gtk.Grid{

        protected IServer _server;
        protected Gtk.Label label;
        protected ServerStatusIndicator indicator;
        protected Gtk.Switch keep_alive;

        public IServer server {
            get{
                return this._server;
            }
            protected set{
                this._server = value;
            }
        }

        public DefaultServerRow(IServer server){

            this.server = server;
            this.label.label = server.nickname;
            this.indicator.state = server.status;
            this.server.status_changed.connect(update_indicator);
            base.show_all();
        }

        construct{

            base.set_column_spacing(15);
            base.set_row_spacing(5);

            this.label = new Gtk.Label("");
            this.label.get_style_context().add_class("server-row-header");
            //this.label.baseline_position = Gtk.BaselinePosition.CENTER;
            this.indicator = new ServerStatusIndicator();
            //this.indicator.baseline_position = Gtk.BaselinePosition.CENTER;
            this.keep_alive = new Gtk.Switch();

            //Add arrange the widgets in their container
            //var switch_box = new Gtk.Box(Gtk.Orientation.VERTICAL, 5);
            //switch_box.add(new Gtk.Label("Keep Alive?"));
            //switch_box.add(this.keep_alive);
            //switch_box.baseline_position = Gtk.BaselinePosition.CENTER;

            base.attach(this.label, 0, 0, 20, 3);
            base.attach(new Gtk.Label("Keep Alive"), 4,4);
            base.attach(this.keep_alive, 5, 4, 3, 1);
            base.attach(this.indicator, 18, 4);

            /*base.pack_start(this.label, true, true);
            base.add(switch_box);
            base.pack_end(this.indicator, false, false);*/
            

        }

        protected void update_indicator(ServerStatus state){
            this.indicator.state = state;
        }


    }

}
