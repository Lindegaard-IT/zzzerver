//zZzerver: The simple server management client
//    Copyright (C) 2020  Rasmus Lindegaard

using ZzzServer;
using ZzzServer.Models;
using Gee;

namespace ZzzServer.Services.WakeOnLan{

    public class SshWakeOnLanService : Object, IWakeOnLanService{

        private Map<string, DateTime> starting_servers;

        construct{
            this.starting_servers = new HashMap<string, DateTime>();
        }

        public async ServerStatus check_status_async(string address){
            //do some ping magic here
            return ServerStatus.OFFLINE;
        }

        public ServerStatus check_status(string address){
            var starting = this.starting_servers.get(address);
            if(starting != null && starting.compare(new DateTime.now()) < 1)
                return ServerStatus.POWERING_UP;

            //Do a ping, and evaluate against latency
            return ServerStatus.OFFLINE;
        }

        public async void wake_server_async(string mac, string node_address = "") throws WakeOnLanError{
            //Invoke the wake on lan command, from the node_address, if applicable
        }

        public void wake_server(string mac, string node_address = ""){
            this.starting_servers.set(mac, new DateTime.now().add_minutes(2));

            
        }

        public async void shutdown_async(string address) throws WakeOnLanError{
            //Invoke shutdown -h +01 against the server
        }

        public async void postpone_shutdown_async(string address, uint minutes) throws WakeOnLanError{
            //Invoke shutdown -c then shutdown -h +0{minutes} to postpone server shutdown, effectively keeping the machine alive.


        }

    }

}
