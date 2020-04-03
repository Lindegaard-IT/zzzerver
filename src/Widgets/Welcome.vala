namespace ZzzServer.Widgets{

    public class Welcome : Gtk.Grid{

        public signal void create_server_clicked();

        construct{
            var welcome = new Granite.Widgets.Welcome("zZzerver Client", "It seems you have not configured any server yet...");

            //Option to add a sever configuration
            welcome.append("network-server-symbolic", "Add a server", "Setup a sleepy server and network access node." );

            welcome.append("help-contents", "Help", "If you are unsure about how to get started, there are resources available here");
            base.add(welcome);

            welcome.activated.connect((index) => {
                switch(index){
                    case 0:
                        try{
                            //launch window to set up server
                            this.create_server_clicked();
                        }catch(Error e){
                            warning (e.message);
                        }

                        break;
                    case 1:
                        try{
                            AppInfo.launch_default_for_uri("https://github.com/rasmus91/zzz", null);
                        }catch (Error e){
                            warning(e.message);
                        }
                        break;
                }
            });
        }

    }


}
