//zZzerver: The simple server management client
//    Copyright (C) 2020  Rasmus Lindegaard
using Models;

namespace ZzzServer.Widgets.Main{

    public interface IMainView : Gtk.Widget{

        

        public abstract add_server(IServer server);
        public abstract remove_server(IServer server);

    }

}
