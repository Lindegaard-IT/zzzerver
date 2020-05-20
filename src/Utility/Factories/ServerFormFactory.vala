
namespace ZzzServer.Utility.Factories{

    public class ServerFormFactory : Object{

        private Gee.Map<Type, Type> type_map;

        construct{
            this.type_map = new Gee.HashMap<Type, Type>((t) => { return t.name().hash(); });
        }

        public void register_form<ServerFormType>(){
            var obj_class = (ObjectClass)typeof(ServerFormType).class_ref();
            var prop_type = obj_class.find_property("server").value_type;


            type_map.set(prop_type, typeof(ServerFormType));
        }

        public Widgets.IServerForm<T> edit<T>(T server){
            var type = Type.from_instance(server);
            var form_type = type_map.get(type); //Does not get the type for some reason

            var frm = (Widgets.IServerForm<T>)Object.new(form_type, "server", server, "orientation", Gtk.Orientation.VERTICAL);
            return frm;
        }

    }

}
