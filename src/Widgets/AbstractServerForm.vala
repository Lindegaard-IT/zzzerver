//zZzerver: The simple server management client
//    Copyright (C) 2020  Rasmus Lindegaard

namespace ZzzServer.Widgets{

    public abstract class AbstractServerForm<T> : Gtk.Grid, IServerForm<T>{

        protected bool editing;
        protected Gtk.Grid form;
        protected Gtk.Button submit_button;
        protected Gtk.Button cancel_button;

        public AbstractServerForm(bool editing = false){
            /*Object(
                orientation: Gtk.Orientation.VERTICAL,
                spacing: 30,
                baseline_position: Gtk.BaselinePosition.CENTER
            );*/
            this.submit_button.add(new Gtk.Label(editing ? "Create" : "Save"));
        }

        construct{

            base.set_row_spacing(10);
            base.set_column_spacing(10);

            this.form = new Gtk.Grid();
            this.form.set_row_spacing(15);
            this.form.set_column_spacing(5);


            //var scroller = new Gtk.ScrolledWindow(null, null);
            //scroller.add(this.form);
            //scroller.halign = Gtk.Align.CENTER;

            var scroll_container = new Gtk.Box(Gtk.Orientation.VERTICAL, 0);
            scroll_container.pack_start(this.form, true, true);
            scroll_container.halign = Gtk.Align.CENTER;

            //var button_container = new Gtk.Box(Gtk.Orientation.HORIZONTAL, 20);


            this.cancel_button = new Gtk.Button.with_label("Cancel");
            this.cancel_button.valign = Gtk.Align.CENTER;
            this.submit_button = new Gtk.Button();
            this.submit_button.get_style_context().add_class("suggested-action");
            //button_container.pack_start(this.cancel_button, false, true, 0);
            //button_container.pack_end(this.submit_button, false, true, 0);

            var separator = new Gtk.Separator(Gtk.Orientation.HORIZONTAL);

            base.attach(scroll_container, 0, 0, 28, 32);
            base.attach_next_to(separator, scroll_container, Gtk.PositionType.BOTTOM, 28);
            base.attach(this.cancel_button, 4, 34);
            base.attach(this.submit_button, 20, 34);
        }

    }


}
