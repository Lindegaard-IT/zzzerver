//zZzerver: The simple server management client
//    Copyright (C) 2020  Rasmus Lindegaard

using ZzzServer.Models;
using ZzzServer.Widgets;

namespace ZzzServer.Widgets.Main{


    public class DefaultMainView : Gtk.Box{

        protected Gtk.ListBox server_rows;

        public DefaultMainView(Gee.List<IServer> source){
            Object(
                orientation: Gtk.Orientation.VERTICAL,
                spacing: 0
            );
        }

        construct{

            

        }



    }


}
