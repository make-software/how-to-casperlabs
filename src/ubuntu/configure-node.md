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
sudo -u casper /etc/casper/node_util.py stage_protocols $CASPER_NETWORK.conf
```

The above command will download and stage all available node upgrades to your machine so they are prepped when the node is turned on, and will automatically execute the upgrade and the required time.

### Get known validator IP

Let's get a known validator IP first. We'll use it multiple times later in the process.

```
KNOWN_ADDRESSES=$(sudo -u casper cat /etc/casper/1_0_0/config.toml | grep known_addresses)
KNOWN_VALIDATOR_IPS=$(grep -oE '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' <<< "$KNOWN_ADDRESSES")
IFS=' ' read -r KNOWN_VALIDATOR_IP _REST <<< "$KNOWN_VALIDATOR_IPS"

echo $KNOWN_VALIDATOR_IP
```

After running the commands above the ```$KNOWN_VALIDATOR_IP``` variable will contain IP address of a known validator.

### Set trusted hash


> ### Note
> Setting the `trusted_hash` is only required if you join the network after Genesis has taken place. If you are joining 
> prior to Genesis, you may skip this step and continue at "Start the node".

Set the `trusted_hash` to the hash value of block `20` on Casper TestNet:

```
# Get trusted_hash into config.toml
TRUSTED_HASH=d90602860b06b90a76e58bb7963898f2c1fd91c8e5c57f4a5a4ee42f70e1980c

if [ "$TRUSTED_HASH" != "null" ]; then sudo -u casper sed -i "/trusted_hash =/c\trusted_hash = '$TRUSTED_HASH'" /etc/casper/1_0_0/config.toml; fi
```
