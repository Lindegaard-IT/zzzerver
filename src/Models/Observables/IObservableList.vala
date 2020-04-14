//zZzerver: The simple server management client
//    Copyright (C) 2020  Rasmus Lindegaard

namespace ZzzServer.Models.Observables{

    public delegate IObservableList<T> wrap_list<T>(Gee.List<T> list);

    public interface IObservableList<T> : IObservableBase<T, Gee.List<T>>, Gee.List<T>{

        internal abstract Gee.List<T> source { get; }

        //Why doesn't it just inherit these from the IObservableCollection<T> ?????
        //public signal void added(T item);
        //public signal void removed(T item);
        //public signal void cleared();

        public signal void index_inserted(int index, T item);
        public signal void index_changed(int index, T item);
        public signal void index_removed(int index, T item);

        public static wrap_list<T> wrapper;
        public static IObservableList<T> wrap<T>(Gee.List<T> list){
            if(wrapper == null)
                wrapper = (_list) => {
                    //check if it already is an IObservableList, if so, cast it and return it.
                    var type = GLib.Type.from_instance(_list);
                    var type_is_an_observableList = type.is_a(typeof(IObservableList));

                    if(type_is_an_observableList)
                        return (IObservableList<T>)_list;


                    //check if it is an IObservableCollection, if so:
                    // 1. copy ALL the handles for cleared, removed and added signals
                    // 2. copy the data source, and wrap it in a list
                    // 3. connect all the handlers for the signals
                    var type_is_an_observableCollection = type.is_a(typeof(IObservableCollection));

                    if(type_is_an_observableCollection){
                        var _list_obs = (IObservableCollection<T>)_list;
                        var source_as_list = (Gee.List<T>) _list_obs.source;
                        var obsList = new ObservableList<T>.wrap(source_as_list);

                        //obsList.removed =  _list_obs.removed;
                        //obsList.added = _list_obs.added;
                        //obsList.cleared = _list_obs.cleared;

                        return obsList;
                    }

                    //if neither of the above applies:
                    return new ObservableList<T>.wrap(_list);
                };

            return wrapper<T>(list);
        }

    }

}
