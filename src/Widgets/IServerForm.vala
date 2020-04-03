
namespace ZzzServer.Widgets{

    public interface IServerForm<T> : Gtk.Widget{

        public signal void submit(T server);
        public signal void cancel();

    }

}
