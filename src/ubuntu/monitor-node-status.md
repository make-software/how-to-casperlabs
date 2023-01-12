### Monitor the node status

#### Check the node log

Please note that it is expected to see a lot of connection messages flooding your screen when you check the logs. Don't be scared by the `request timed out` and `outgoing connection failed` messages as long as they are all `INFO` level messages, and as long as you also see a lot of `linear chain block stored` messages, which means that your node is successfully fetching and storing existing blocks from other/older peers on the network.

```
sudo tail -fn100 /var/log/casper/casper-node.log /var/log/casper/casper-node.stderr.log
```

#### Check if a known validator sees your node among peers

```
curl -s http://$KNOWN_VALIDATOR_IP:8888/status | jq .peers
```

You should see your IP address on the list

#### Check the node status

```
curl -s http://127.0.0.1:8888/status | jq
```

#### Monitor the node's sync progres
You can monitor the node's synchronization progress by using the ```node_util.py``` utility script again:

```
/etc/casper/node_util.py watch
```

When you run the watch command, expect to see something like this:
```
Last Block: 630151 (Era: 4153)
Peer Count: 297
Uptime: 4days 6h 40m 18s 553ms
Build: 1.4.5-a7f6a648d-casper-mainnet
Key: 0147b4cae09d64ab6acd02dd0868722be9a9bcc355c2fdff7c2c244cbfcd30f158
Next Upgrade: None

RPC: Ready

● casper-node-launcher.service - Casper Node Launcher
   Loaded: loaded (/lib/systemd/system/casper-node-launcher.service; enabled; vendor preset: enabled)
   Active: active (running) since Wed 2022-03-16 21:08:50 UTC; 4 days ago
     Docs: https://docs.casperlabs.io
 Main PID: 2934 (casper-node-lau)
    Tasks: 12 (limit: 4915)
   CGroup: /system.slice/casper-node-launcher.service
           ├─ 2934 /usr/bin/casper-node-launcher
           └─16842 /var/lib/casper/bin/1_4_5/casper-node validator /etc/casper/1_4_5/config.toml
```

If your casper-node-launcher status is not active (running) with increasing time, you are either not running or restarting.

The watch command also allows an `--ip` argument to use with a node on the same network that is in sync.  This will show how far behind your node currently is.

#### Wait for node to catch up
Before you do anything, such as trying to bond as a validator or perform any RPC calls, make sure your node has fully
caught up with the network. You can recognize this by log entries that tell you that joining has finished, and that the
RPC and REST servers have started:

```
{"timestamp":"Feb 09 02:28:35.577","level":"INFO","fields":{"message":"finished joining"},"target":"casper_node::cli"}
{"timestamp":"Feb 09 02:28:35.578","level":"INFO","fields":{"message":"started JSON-RPC server","address":"0.0.0.0:7777"},"target":"casper_node::components::rpc_server::http_server"}
{"timestamp":"Feb 09 02:28:35.578","level":"INFO","fields":{"message":"started REST server","address":"0.0.0.0:8888"},"target":"casper_node::components::rest_server::http_server"}
```