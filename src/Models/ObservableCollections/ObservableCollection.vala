//zZzerver: The simple server management client
//    Copyright (C) 2020  Rasmus Lindegaard

namespace ZzzServer.Models.ObservableCollections{

    public class ObservableCollection<T> : IObservableBase<T, Gee.Collection<T>>, IObservableCollection<T>, Gee.AbstractCollection<T>{

        protected Gee.Collection<T> collection;

        public Gee.Collection<T> source {
            get{
                return this.collection;
            }
        }

        public override bool read_only{
            get{
                return this.collection.read_only;
            }
        }

        public override int size{
            get{
                return this.collection.size;
            }
        }

        protected ObservableCollection(){
        }

        internal ObservableCollection.wrap(Gee.Collection<T> collection){
            this.collection = collection;
        }

        public override bool add(T item){
            var result = this.collection.add(item);
            if(result)
                added(item);

            return result;
        }

        public override void clear(){
            this.collection.clear();
            cleared();
        }

        public override bool contains(T item){
            return this.collection.contains(item);
        }

        public override Gee.Iterator<T> iterator(){
            return this.collection.iterator();
        }

        public override bool remove(T item){
            var result = this.collection.remove(item);
            if(result)
                removed(item);

            return result;
        }

    }
}
