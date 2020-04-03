//zZzerver: The simple server management client
//    Copyright (C) 2020  Rasmus Lindegaard

namespace ZzzServer.Models {

    public enum ServerStatus{

        OFFLINE = 0,
        POWERING_UP = 1,
        ONLINE = 2,
        ONLINE_HIGH_LATENCY = 3;

    }

}
