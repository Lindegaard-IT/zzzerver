//zZzerver: The simple server management client
//    Copyright (C) 2020  Rasmus Lindegaard

using ZzzServer.Widgets;

namespace ZzzServer{

    public class Client : Gtk.Application{

        public Client(){
            Object(
                application_id: "com.github.rasmus91.zzzerver",
                flags: ApplicationFlags.FLAGS_NONE
            );
        }

        protected override void activate(){
            var main_window = new Gtk.ApplicationWindow (this);
            main_window.default_height = 400;
            main_window.default_width = 350;
            main_window.title = "zZzerver";

            //use custom titblebar
            var header = new HeaderBar();
            main_window.set_titlebar(header);
            

            //create historystack
            var history = new HistoryStack();

            header.back_button = history.back_button;

            var welcome = new Widgets.Welcome();


            welcome.create_server_clicked.connect(() => {
                var wolserver = new WakeOnLanServerForm();
                wolserver.cancel.connect(history.back);
                wolserver.submit.connect((server) => {
                    message(server.nickname);
                    history.back();
                });
                history.sub_page = wolserver;
            });

            history.add(welcome);
            history.visible_child = welcome;
            //add interface objects
            main_window.add(history);
            //Show all widgets
            main_window.show_all();
            header.back_button.visible = false;

            var provider = new Gtk.CssProvider ();
            provider.load_from_resource ("com/github/rasmus91/zzzerver/Application.css");
            Gtk.StyleContext.add_provider_for_screen (Gdk.Screen.get_default (), provider, Gtk.STYLE_PROVIDER_PRIORITY_APPLICATION);
        }

        protected void configure_css(){
            
        }

        public static int main (string[] args){
            Client app = new Client();
            return app.run(args);
        }

    }
}
