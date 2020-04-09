//zZzerver: The simple server management client
//    Copyright (C) 2020  Rasmus Lindegaard
using ZzzServer.Models;

namespace ZzzServer.Widgets{

    public class ServerStatusIndicator : Gtk.Stack{

        private Gtk.Image offline;
        private Gtk.Image online;
        private Gtk.Image online_high_latency;
        private Gtk.Image disconnected;

        private Gtk.Spinner powering_up;

        private ServerStatus _state;
        public ServerStatus state {
            get{
                return this._state;
            }
            set{
                if(_state != value){
                    switch(value){
                        case ServerStatus.POWERING_UP:
                            base.visible_child_name = value.to_string();
                            this.powering_up.start();
                            break;
                        default:
                            this.powering_up.stop();
                            base.visible_child_name = value.to_string();
                            break;
                    }
                    this._state = value;
                }
            }
        }

        construct{
            this.offline = new Gtk.Image.from_icon_name("user-offline", Gtk.IconSize.LARGE_TOOLBAR);
            this.online = new Gtk.Image.from_icon_name("user-online", Gtk.IconSize.LARGE_TOOLBAR);
            this.online_high_latency = new Gtk.Image.from_icon_name("user-away", Gtk.IconSize.LARGE_TOOLBAR);
            this.disconnected = new Gtk.Image.from_icon_name("network-disconnected-symbolic", Gtk.IconSize.LARGE_TOOLBAR);

            this.powering_up = new Gtk.Spinner();

            base.add_named(this.offline, ServerStatus.OFFLINE.to_string());
            base.add_named(this.online, ServerStatus.ONLINE.to_string());
            base.add_named(this.online_high_latency, ServerStatus.ONLINE_HIGH_LATENCY.to_string());
            base.add_named(this.powering_up, ServerStatus.POWERING_UP.to_string());
        }

    }

}
