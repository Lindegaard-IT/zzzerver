//zZzerver: The simple server management client
//    Copyright (C) 2020  Rasmus Lindegaard

namespace ZzzServer.Models.ObservableCollections{

    public delegate IObservableCollection<T> wrap_collection<T>(Gee.Collection<T> collection);

    public interface IObservableCollection<T> : IObservableBase<T, Gee.Collection<T>>, Gee.Collection<T>{

        public static wrap_collection<T> wrapper;
        public static IObservableCollection<T> wrap_collection<T>(Gee.Collection<T> collection){
            if(wrapper == null)
                wrapper = (_collection) => {
                    var type_of_collection = Type.from_instance(_collection);
                    var collection_is_observable = type_of_collection.is_a(typeof(IObservableCollection));

                    if(collection_is_observable)
                        return (IObservableCollection<T>)_collection;

                    var observable_collection = new ObservableCollection<T>.wrap(_collection);
                    return observable_collection;
                };

                return wrapper(collection);
        }

    }

}
