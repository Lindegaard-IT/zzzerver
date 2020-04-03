//zZzerver: The simple server management client
//    Copyright (C) 2020  Rasmus Lindegaard

namespace ZzzServer.Widgets{

    public class ServerDialog : Gtk.Dialog{


        public ServerForm server;
        //protected Client parent;
        construct {
            this.server = new ServerForm();
            var body = base.get_content_area();
            body.add(this.server);
        }

        public ServerDialog(Gtk.Window parent){
            Object(
                border_width: 5,
			    deletable: false,
			    resizable: false,
			    title: "New Server",
			    transient_for: parent//,
			    //window: parent
			);
        }



    }

}
