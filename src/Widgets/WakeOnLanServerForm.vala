//zZzerver: The simple server management client
//    Copyright (C) 2020  Rasmus Lindegaard

using ZzzServer.Models;
using ZzzServer.Services.WakeOnLan;

namespace ZzzServer.Widgets {

    errordomain ServerFormErrors{
        MissingField;
    }

    public class WakeOnLanServerForm : AbstractServerForm<WakeOnLanServer> {

        protected Gtk.Entry name;
        protected Gtk.Entry address;
        protected Gtk.Entry mac;
        protected Gtk.ComboBox wireguard_interfaces;

        public override WakeOnLanServer server {
            set{
                if(value != null){
                    this.address.text = value.address;
                    this.name.text = value.nickname;
                    this.mac.text = value.mac;
                }else{
                    this.address.text = "";
                    this.name.text = "";
                    this.mac.text = "";
                }
            }
        }

        public WakeOnLanServerForm(){
            base(false);
        }

        construct{

            this.name = new Gtk.Entry();
            this.name.placeholder_text = "Home Server";

            this.address = new Gtk.Entry();
            this.address.placeholder_text = "10.0.0.1";

            this.mac = new Gtk.Entry();
            this.mac.placeholder_text = "1A:2B:3C:4D:5E:6F:7G:8H";

            this.wireguard_interfaces = new Gtk.ComboBox();

            var server_name_lbl = new Gtk.Label("Name:");
            server_name_lbl.halign = Gtk.Align.END;

            this.form.attach(this.name, 0, 0);
            this.form.attach_next_to(server_name_lbl, this.name, Gtk.PositionType.LEFT);

            var address_lbl = new Gtk.Label("Address or URL:");
            address_lbl.halign = Gtk.Align.END;

            this.form.attach(this.address, 0, 1);
            this.form.attach_next_to(address_lbl, this.address, Gtk.PositionType.LEFT);


            var mac_label = new Gtk.Label("MAC Address:");
            mac_label.halign = Gtk.Align.END;

            this.form.attach(this.mac, 0, 2);
            this.form.attach_next_to(mac_label, this.mac, Gtk.PositionType.LEFT);

        }

        protected override WakeOnLanServer get_server(){
            return new WakeOnLanServer.with_data(
                new Services.WakeOnLan.SshWakeOnLanService(),
                this.address.text,
                this.name.text,
                this.mac.text,
                ""
            );
        }

    }
}
