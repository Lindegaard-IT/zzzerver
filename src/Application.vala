

namespace zzzserver{

    public class Client : Gtk.Application{

        public Client(){
            Object(
                application_id: "com.github.rasmus91.zzzerver",
                flags: ApplicationFlags.FLAGS_NONE
            );
        }

        protected override void activate(){
            var main_window = new Gtk.ApplicationWindow (this);
            main_window.default_height = 300;
            main_window.default_width = 300;
            main_window.title = "zZzerver";

            //add interface objects
            main_window.show_all();
        }

        public static int main (string[] args){
            Client app = new Client();
            message("hest");
            return app.run(args);
        }

    }
}
