//zZzerver: The simple server management client
//    Copyright (C) 2020  Rasmus Lindegaard

using ZzzServer.Models;
using ZzzServer.Widgets;

namespace ZzzServer.Widgets.Main{

    public class DefaultServerRow : Gtk.Grid{

        protected Gdk.Pixbuf icon_keep_alive;
        protected Gdk.Pixbuf icon_dont_keep_alive;

        protected IServer _server;
        protected Gtk.Label label;
        protected ServerStatusIndicator indicator;
        protected Granite.ModeSwitch keep_alive;

        public IServer server {
            get{
                return this._server;
            }
            protected set{
                this._server = value;
                this._server.bind_property("nickname", this.label, "label", BindingFlags.SYNC_CREATE);
                this._server.bind_property("status", this.indicator, "state", BindingFlags.SYNC_CREATE);
                //this.server.status_changed.connect(update_indicator);
            }
        }

        public DefaultServerRow(IServer server){

            this.server = server;
            
            base.show_all();
        }

        construct{

            this.icon_keep_alive = new Gdk.Pixbuf.from_resource_at_scale("/com/github/rasmus91/zzzerver/heart-symbolic", 16, 16, true);
            this.icon_dont_keep_alive = new Gdk.Pixbuf.from_resource_at_scale("/com/github/rasmus91/zzzerver/heart-crossed-symbolic", 16 ,16, true);

            base.set_column_spacing(15);
            base.set_row_spacing(5);

            this.label = new Gtk.Label("");
            this.label.get_style_context().add_class("server-row-header");
            //this.label.baseline_position = Gtk.BaselinePosition.CENTER;
            this.indicator = new ServerStatusIndicator();
            //this.indicator.baseline_position = Gtk.BaselinePosition.CENTER;
            this.keep_alive = new Granite.ModeSwitch(icon_dont_keep_alive, icon_keep_alive);//Gtk.Switch();


            //Add arrange the widgets in their container
            //var switch_box = new Gtk.Box(Gtk.Orientation.VERTICAL, 5);
            //switch_box.add(new Gtk.Label("Keep Alive?"));
            //switch_box.add(this.keep_alive);
            //switch_box.baseline_position = Gtk.BaselinePosition.CENTER;

            base.attach(this.label, 0, 0, 20, 3);
            //base.attach(new Gtk.Label("Keep Alive"), 4,4);
            //base.attach(this.keep_alive, 5, 4, 2, 1);
            base.attach(this.indicator, 18, 3);

            /*base.pack_start(this.label, true, true);
            base.add(switch_box);
            base.pack_end(this.indicator, false, false);*/
            

        }


    }

}
