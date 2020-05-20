//zZzerver: The simple server management client
//    Copyright (C) 2020  Rasmus Lindegaard

using ZzzServer.Widgets;

namespace ZzzServer{

    public class Client : Gtk.Application{

        private ListStore servers;//Gee.List<Models.IServer> servers;
        private Utility.Factories.ServerFormFactory form_factory;

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

            //Primary view
            var prim_view = new Widgets.Main.DefaultMainView(this.servers);

            prim_view.server_clicked.connect((server) => {
            var form = form_factory.edit(server);
                form.cancel.connect(history.back);
                form.submit.connect((srv) => {
                    server = srv;
                    history.back();
                });
                history.sub_page = form;
            });


            var welcome = new Widgets.Welcome();

            welcome.create_server_clicked.connect(() => {
                var wolserver = new WakeOnLanServerForm();
                wolserver.cancel.connect(history.back);
                wolserver.submit.connect((server) => {
                    this.servers.append(server);
                    history.base_page = prim_view;
                    history.back();
                });
                history.sub_page = wolserver;
            });


            history.base_page = welcome;
            //add interface objects
            main_window.add(history);

            //Show all widgets
            main_window.show_all();
            header.back_button.visible = false;

            var provider = new Gtk.CssProvider ();
            provider.load_from_resource ("com/github/rasmus91/zzzerver/Application.css");
            Gtk.StyleContext.add_provider_for_screen (Gdk.Screen.get_default (), provider, Gtk.STYLE_PROVIDER_PRIORITY_APPLICATION);
        }

        construct{
            this.servers = new ListStore(typeof(Models.IServer));//new Gee.ArrayList<Models.IServer>();
            this.form_factory = configure_serverform_handler();
        }

        protected Utility.Factories.ServerFormFactory configure_serverform_handler(){
            var srv_form_factory = new Utility.Factories.ServerFormFactory();
            srv_form_factory.register_form<Widgets.WakeOnLanServerForm>();

            return srv_form_factory;
        }

        public static int main (string[] args){
            Client app = new Client();
            return app.run(args);
        }

    }
}
