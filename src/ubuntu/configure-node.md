## Configure and Run the Node

### Configure the node's firewall
In order to secure your node somewhat from unauthorized/excessive connections/requests, you can configure the firewall of the node using a template ```ufw``` setup:

```
cd ~; curl -JLO https://genesis.casperlabs.io/firewall.sh
chmod +x ./firewall.sh

# Look at this and make sure you understand what it does and want to run it on your server.
# You will need to provide `y` to reset and enable steps.
cat ./firewall.sh

# Install firewall
sudo ./firewall.sh
```

### Stage all protocol upgrades

```
sudo -u casper /etc/casper/node_util.py stage_protocols casper-test.conf
```

The above command will download and stage all available node upgrades to your machine so they are prepped when the node is turned on, and will automatically execute the upgrade and the required time.

### Set trusted hash

Set the `trusted_hash` to the hash value of the latest block on Casper TestNet:

```
NODE_ADDR=https://rpc.testnet.casperlabs.io
PROTOCOL=1_5_8
sudo sed -i "/trusted_hash =/c\trusted_hash = '$(casper-client get-block --node-address $NODE_ADDR | jq -r .result.block.hash | tr -d '\n')'" /etc/casper/$PROTOCOL/config.toml
```

The command above will set the trusted hash on the config file of the `1.5.8` protocol version. Please note that the protocol version should be set to the largest available protocol version you see in `ls /etc/casper`.
