//zZzerver: The simple server management client
//    Copyright (C) 2020  Rasmus Lindegaard

namespace ZzzServer.Models.ObservableCollections{

    public class ObservableList<T> : IObservableBase<T, Gee.List<T>>, IObservableList<T>, Gee.AbstractList<T>{

        protected Gee.List<T> list;

        public Gee.List<T> source {
            get{
                return this.list;
            }
        }

        public override int size {
            get{
                return this.list.size;
            }
        }

        public override bool read_only{
            get{
                return this.list.read_only;
            }
        }

        //If this is called, it is important to set the value of this.list manually
        protected ObservableList(){
        }

        //this.list should always be set like this, so the designer of the caller has made the decision of whether to use ArrayList or LinkedList
        //futhermore, this should always be called by the static method in the interface
        internal ObservableList.wrap(Gee.List<T> list){
            this.list = list;
        }

        private void signal_changed(int index, T item, T previous){
            index_changed(index, item);
            removed(previous);
            added(item);
        }

        private void signal_removed(int index, T item){
            index_removed(index, item);
            removed(item);
        }

        private void signal_inserted(int index, T item){
            index_inserted(index, item);
            added(item);
        }

        //AbstractList methods etc.
        public override T @get (int index){
            return this.list.get(index);
        }

        public override void @set (int index, T item){
            var current_item = this.list.get(index);
            if(current_item != item){
                this.list.set(index, item);
                signal_changed(index, item, current_item);
            }
        }

        public override int index_of(T item){
            return this.list.index_of(item);
        }

        public override void insert(int index, T item){
            this.list.insert(index, item); //Consider how the signal should happen here
            this.signal_inserted(index, item);
        }

        public override Gee.ListIterator<T> list_iterator(){
            return this.list.list_iterator();
        }

        public override T remove_at(int index){
            var item = this.remove_at(index);
            signal_removed(index, item);
            return item;
        }

        public override Gee.List<T>? slice(int start, int stop){
            return this.list.slice(start, stop);
        }

        //AbstractCollection methods
        public override bool add(T item){
            var result = this.list.add(item);

            if(result)
                this.signal_inserted(this.list.size - 1, item);

            return result;
        }

        public override void clear(){
            this.list.clear();
            cleared();
        }

        public override bool contains(T item){
            return this.list.contains(item);
        }

        public override Gee.Iterator<T> iterator(){
            return this.list.iterator();
        }

        public override bool remove(T item){
            var index = this.list.index_of(item);
            if(index > -1){
                this.remove_at(index);
                return true;
            }
            return false;
        }

    }

}
