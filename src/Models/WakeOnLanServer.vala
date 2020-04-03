//zZzerver: The simple server management client
//    Copyright (C) 2020  Rasmus Lindegaard

using ZzzServer.Services.WakeOnLan;

namespace ZzzServer.Models{

    public class WakeOnLanServer : IServer, Object{

        protected IWakeOnLanService _service { get; private set; }

        public ServerStatus status { get; set; }

        public string address { get; set; }
        public string nickname { get; set; }
        public string mac { get; set; }
        public bool keep_alive { get; set; }
        public string wireguard_interfacename { get; set; }

        public WakeOnLanServer(IWakeOnLanService service){

            this._service = service;

        }

        public WakeOnLanServer.with_data(IWakeOnLanService service, string address, string nickname, string mac, string wireguard){
            this._service = service;
            this.address = address;
            this.nickname = nickname;
            this.mac = mac;
            this.wireguard_interfacename = wireguard;
        }

        public void start(){
            
            
            
        }

        public void end(){
            
        }

    }

}
