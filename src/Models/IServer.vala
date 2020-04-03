
namespace ZzzServer.Models{

    public interface IServer : Object{

        public signal void status_changed(ServerStatus new_state);

        public abstract ServerStatus status { get; protected set; }

        public abstract string address { get; set; }
        public abstract string nickname { get; set; }

        public abstract void start();
        public abstract void end();

    }

}
