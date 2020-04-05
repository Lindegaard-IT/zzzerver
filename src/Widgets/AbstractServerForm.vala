//zZzerver: The simple server management client
//    Copyright (C) 2020  Rasmus Lindegaard

namespace ZzzServer.Widgets{

    public abstract class AbstractServerForm<T> : Gtk.Paned, IServerForm<T>{

        protected bool editing;
        protected Gtk.Grid form;
        protected Gtk.Button submit_button;
        protected Gtk.Button cancel_button;

        public AbstractServerForm(bool editing = false){
            Object(
                orientation: Gtk.Orientation.VERTICAL
            );
            this.submit_button.add(new Gtk.Label(editing ? "Create" : "Save"));
        }

        construct{

            this.form = new Gtk.Grid();
            this.form.set_row_spacing(15);
            this.form.set_column_spacing(5);


            //var scroller = new Gtk.ScrolledWindow(null, null);
            //scroller.add(this.form);

            var centerer = new Gtk.Box(Gtk.Orientation.HORIZONTAL, 10);
            centerer.set_hexpand(true);

            var vcenter = new Gtk.Box(Gtk.Orientation.VERTICAL, 0);
            vcenter.set_center_widget(this.form);

            centerer.set_center_widget(vcenter);

            var view = new Gtk.Viewport(null, null);
            view.add(centerer);

            var button_container = new Gtk.Box(Gtk.Orientation.HORIZONTAL, 20);

            this.cancel_button = new Gtk.Button.with_label("Cancel");
            this.cancel_button.valign = Gtk.Align.CENTER;
            this.cancel_button.clicked.connect(() => { cancel(); });

            this.submit_button = new Gtk.Button();
            this.submit_button.get_style_context().add_class("suggested-action");
            this.submit_button.valign = Gtk.Align.CENTER;
            this.submit_button.clicked.connect(() => {
                var server_instance = get_server();
                submit(server_instance);
            });

            button_container.pack_start(this.cancel_button, false, false, 20);
            button_container.pack_end(this.submit_button, false,false, 20);

            base.pack1(view, false, false);
            base.pack2(button_container, false, false);
        }

        protected abstract T get_server();

    }


}
