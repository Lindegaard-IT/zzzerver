//zZzerver: The simple server management client
//    Copyright (C) 2020  Rasmus Lindegaard

namespace ZzzServer.Widgets{

    public interface IServerForm<T> : Gtk.Widget{

        public signal void submit(Models.IServer server);
        public signal void cancel();

        public abstract T server { set; }

    }

}
