# Restore full Testnet node DB from daily snapshots on Ubuntu 20.04

> ## **IMPORTANT**
> By choosing to participate in the Casper Test Net, you acknowledge that you have reviewed and will abide by
> the [Test Net Code of Conduct and Incentive Requirements](../testnet.md). Failure to do so may reduce or fully 
> disqualify any Test Net incentive participation.
> 
> Before you set up your node, make sure it conforms to the minimum [Recommended Hardware Specifications](https://docs.casper.network/operators/setup/hardware/)


> ### Note  
> Do not execute all the commands below as `root`. `sudo` is included where it is required.
>
> Do not create or use the username `casper`. It will be automatically created during the installation, and is meant to be used by the node software as a no-login user.
> 
> Expect that initial setup of a node will take about 15-20 minutes, and you will need to wait for a few hours for the node to sync before bonding it to the network.

### Create account

Install [Casper Wallet](https://www.casperwallet.io), and import your `secret_key.pem` file following the steps described under the `Import keys into Casper Wallet` section of the [Migrating to Casper Wallet from Signer](https://www.casperwallet.io/user-guide/signer-user-start-here) guide.

### Fund account

### Start the node

```
sudo logrotate -f /etc/logrotate.d/casper-node
sudo systemctl start casper-node-launcher; sleep 2
systemctl status casper-node-launcher
```

### Monitor the node status

#### Check the node log

Please note that it is expected to see a lot of connection messages flooding your screen when you check the logs. Don't be scared by the `request timed out` and `outgoing connection failed` messages as long as they are all `INFO` level messages, and as long as you also see a lot of `linear chain block stored` messages, which means that your node is successfully fetching and storing existing blocks from other/older peers on the network.

```
sudo tail -fn100 /var/log/casper/casper-node.log /var/log/casper/casper-node.stderr.log
```

#### Check the node status

```
curl -s http://127.0.0.1:8888/status | jq
```

#### Monitor the node's sync progres
You can monitor the node's synchronization progress by using the ```node_util.py``` utility script:

```
/etc/casper/node_util.py watch
```

When you run the watch command, expect to see something like this:
```
Every 5.0s: /etc/casper/node_util.py node_status ; /etc/casper/node_util.py systemd_status

Last Block: 2035316 (Era: 10565)
Peer Count: 214
Uptime: 1day 20h 31m 7s 504ms
Build: 1.5.2-86b7013
Key: 0173a3611a3730d6d1a71e91c15a046b3278f6ae9291df6963067958d87035e1fc
Next Upgrade: None

Reactor State: KeepUp
Available Block Range - Low: 2028872  High: 2035316

● casper-node-launcher.service - Casper Node Launcher
     Loaded: loaded (/lib/systemd/system/casper-node-launcher.service; enabled; vendor preset: enabled)
     Active: active (running) since Fri 2023-09-08 22:15:57 UTC; 1 day 20h ago
       Docs: https://docs.casperlabs.io
   Main PID: 2775 (casper-node-lau)
      Tasks: 11 (limit: 38291)
     Memory: 29.3G
     CGroup: /system.slice/casper-node-launcher.service
             ├─2775 /usr/bin/casper-node-launcher
             └─2789 /var/lib/casper/bin/1_5_2/casper-node validator /etc/casper/1_5_2/config.toml
```

If your Reactor State is in "CatchUp" you will need to wait for the node to gather more blocks before it will become "KeepUp" and subsequently show an "Available Block Range". 

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

While Monitoring the node’s synchronization progress using the node_util.py utility script:
```
/etc/casper/node_util.py watch
```
Make sure the Node is in KeepUp and has synced enough blocks for the current TTL (2 hours / 16.384 = 450 blocks) before continuing with the next steps.


_Please note that the Casper Testnet program is implemented by providing rewards
through the [Casper Association](https://casper.network) (CA), a not-for-profit, Switzerland-domiciled organization
responsible for overseeing the Casper network and supporting its organic evolution and continued decentralization.
MAKE Technology LLC is not affiliated with the Casper Association, and has no control over the program sponsorship or the incentivized
reward program, and is hosting these guides and documents as a service to the Casper community only._
