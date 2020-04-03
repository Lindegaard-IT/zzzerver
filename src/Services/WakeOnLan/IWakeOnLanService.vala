using ZzzServer;
using ZzzServer.Models;

namespace ZzzServer.Services.WakeOnLan {

    public errordomain WakeOnLanError{
        NODE_UNREACHABLE,
        WAKEONLAN_NOT_INSTALLED,
        MISFORMED_ADDRESS;
    }

    public interface IWakeOnLanService : Object{

        public abstract async ServerStatus check_status_async(string address);

        public abstract async void wake_server_async(string mac, string node_address = "") throws WakeOnLanError;

        public abstract async void shutdown_async(string address) throws WakeOnLanError;

        public abstract async void postpone_shutdown_async(string address, uint minutes) throws WakeOnLanError;

    }

}
