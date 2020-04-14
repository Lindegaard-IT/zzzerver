//zZzerver: The simple server management client
//    Copyright (C) 2020  Rasmus Lindegaard

namespace ZzzServer.Models.Observables{

    //T should be the type of item held in the collection
    //G should be the type of collection/datastructure underlying the observable
    public interface IObservableBase<T, G> : Object{

        public signal void added(T item);
        public signal void removed(T item);
        public signal void cleared();

        internal abstract G source { get; }

    }

}
