## Configure and Run the Node

### Configure the node's firewall
In order to secure your node somewhat from unauthorized/excessive connections/requests, you can configure the firewall of the node using a template ```ufw``` setup:

```
cd ~; curl -JLO https://genesis.casper.network/firewall_only_node_to_node.sh
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
NODE_ADDR=https://node.testnet.casper.network/rpc
PROTOCOL=2_0_1
sudo sed -i "/trusted_hash =/c\trusted_hash = '$(casper-client get-block --node-address $NODE_ADDR | jq -r .result.block_with_signatures.block.Version2.hash | tr -d '\n')'" /etc/casper/$PROTOCOL/config.toml
```

The command above will set the trusted hash on the config file of the `2.0.1` protocol version. Please note that the protocol version should be set to the largest available protocol version you see in `ls /etc/casper`.
