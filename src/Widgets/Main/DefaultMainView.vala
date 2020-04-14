//zZzerver: The simple server management client
//    Copyright (C) 2020  Rasmus Lindegaard

using ZzzServer.Models;
using ZzzServer.Widgets;

namespace ZzzServer.Widgets.Main{


    public class DefaultMainView : Gtk.Box{

        public signal void server_clicked(IServer server);

        private Gtk.ListBox server_rows;

        public DefaultMainView(ListModel list){
            Object(
                orientation: Gtk.Orientation.VERTICAL,
                spacing: 0
            );

            this.server_rows.bind_model(
                list, 
                (item) => {
                    var server = (IServer) item;
                    return new DefaultServerRow(server);
            });


            base.show_all();
        }

        construct{

            this.server_rows = new Gtk.ListBox();
            this.server_rows.selection_mode = Gtk.SelectionMode.NONE;
            base.pack_start(this.server_rows, true, true);

        }



    }


}
