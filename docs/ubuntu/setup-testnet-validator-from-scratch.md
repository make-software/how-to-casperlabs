# Setup Test Net validator node from scratch on Ubuntu 20.04

> ## **IMPORTANT**
> By choosing to participate in the Casper Test Net, you acknowledge that you have reviewed and will abide by
> the [Test Net Code of Conduct and Incentive Requirements](../testnet.md). Failure to do so may reduce or fully 
> disqualify any Test Net incentive participation.
> 
> Before you set up your node, make sure it conforms to the minimum [Recommended Hardware Specifications](https://docs.casper.network/operators/setup/hardware/)


> ### Note  
> Do not execute all the commands below as root. `sudo` is included where it is required.
> 
> Expect that setting up a node and bonding it to the network will take about 30 minutes

## Open Firewall Ports

In your firewall set-up, make sure you expose the following ports to public and that they're routed to your node:

- ```7777``` - rpc port
- ```8888``` - status port
- ```9999``` - event stream port
- ```35000``` - gossip port

## Install software

### Update package repositories

```
sudo apt-get update
```

### Install pre-requisites

```
sudo apt install -y dnsutils software-properties-common git
```

The node uses ```dig``` to get external IP for autoconfig during the installation process

### Install helpers

```
sudo apt install jq -y
```

We will use ```jq``` to process JSON responses from API later in the process

### Remove Previous Versions

If you were running previous versions of the casper-node on this machine, first stop and remove the old versions:

```
sudo systemctl stop casper-node-launcher.service
sudo apt remove -y casper-client
sudo apt remove -y casper-node-launcher
sudo rm /etc/casper/casper-node-launcher-state.toml
sudo rm -rf /etc/casper/1_0_*
sudo rm -rf /var/lib/casper/*
```

### Install Casper node

#### Add Casper repository

Execute the following in order to add the Casper repository to `apt` in Ubuntu. 
```shell
echo "deb [arch=amd64] https://repo.casperlabs.io/releases" focal main | sudo tee -a /etc/apt/sources.list.d/casper.list
curl -O https://repo.casperlabs.io/casper-repo-pubkey.asc
sudo apt-key add casper-repo-pubkey.asc
sudo apt update
```

#### Install the Casper node software

```
sudo apt install casper-node-launcher -y
sudo apt install casper-client -y
```

## Build smart contracts that are required to bond to the network 

### Install pre-requisites for building smart contracts

```
cd ~
sudo apt purge --auto-remove cmake
wget -O - https://apt.kitware.com/keys/kitware-archive-latest.asc 2>/dev/null | gpg --dearmor - | sudo tee /etc/apt/trusted.gpg.d/kitware.gpg >/dev/null
sudo apt-add-repository 'deb https://apt.kitware.com/ubuntu/ focal main'   
sudo apt update
sudo apt install cmake -y

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

sudo apt install libssl-dev -y
sudo apt install pkg-config -y
sudo apt install build-essential -y

BRANCH="1.0.20" \
    && git clone --branch ${BRANCH} https://github.com/WebAssembly/wabt.git "wabt-${BRANCH}" \
    && cd "wabt-${BRANCH}" \
    && git submodule update --init \
    && cd - \
    && cmake -S "wabt-${BRANCH}" -B "wabt-${BRANCH}/build" \
    && cmake --build "wabt-${BRANCH}/build" --parallel 8 \
    && sudo cmake --install "wabt-${BRANCH}/build" --prefix /usr --strip -v \
    && rm -rf "wabt-${BRANCH}"
```

### Build smart contracts

#### Pull sources

Go to your home directory and clone the node repository. Later we will use this path to the smart contracts in our bonding request.

```
cd ~

git clone https://github.com/casper-network/casper-node.git
cd casper-node/
```

#### Checkout the release branch

> **Note**  
> Verify that the version of your contracts matches the version of the casper-node software you have
> installed.

```
git checkout release-1.5.2
```

#### Build the contracts

```
make setup-rs
make build-client-contracts -j
```

## Generate keys and fund your account 

### Generate node keys

Navigate to the default key directory:
```
cd /etc/casper/validator_keys
```
 
And execute the following command to generate the keys:
```
sudo -u casper casper-client keygen .
```

It will create three files in the ```/etc/casper/validator_keys``` directory:

- ```secret_key.pem``` - your private key; never share it with anyone
- ```public_key.pem``` - your public key
- ```public_key_hex``` - hex representation of your public key; copy it to your machine to create an account

Save your keys to a safe place. The public key hex file is used to identify your account when delegators stake their tokens with you or if you are transferring CSPR to this account.

### Create account

Install the Signer app, and import your `secret_key.pem` file following the steps described under the `New User (Has Secret Keys)` section of the [Signer Guide](https://docs.cspr.community/docs/user-guides/SignerGuide.html).

### Fund account

Go to [Testnet CSPR.Live](https://testnet.cspr.live/), and [connect](https://docs.cspr.community/docs/user-guides/Connect-a-Wallet.html) with the account you want to fund. Click `Tools` from the top navigation menu, then click `Faucet`. Wait for the faucet page to load, and click the `Request tokens` button. Wait until the request transaction succeeds.

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

## Bond to the network

Once you ensure that your node is running correctly and is visible by other proceed to bonding.

### Check your balance

Check your balance to ensure you have funds to bond:

[comment]: <> ([include ../casper-client/check-balance.md])

If you followed the installation steps from this document you can run the following script to check the balance:

```
PUBLIC_KEY_HEX=$(sudo -u casper cat /etc/casper/validator_keys/public_key_hex)
STATE_ROOT_HASH=$(casper-client get-state-root-hash --node-address http://127.0.0.1:7777 | jq -r '.result | .state_root_hash')
PURSE_UREF=$(sudo -u casper casper-client query-state --node-address http://127.0.0.1:7777 --key "$PUBLIC_KEY_HEX" --state-root-hash "$STATE_ROOT_HASH" | jq -r '.result | .stored_value | .Account | .main_purse')
casper-client get-balance --node-address http://127.0.0.1:7777 --purse-uref "$PURSE_UREF" --state-root-hash "$STATE_ROOT_HASH" | jq -r '.result | .balance_value'
```

### Make bonding request

[comment]: <> ([include ../casper-client/bond.md])

If you followed the installation steps from this document you can run the following script to bond. 
It substitutes the public key hex value for you and sends recommended argument values:

```
PUBLIC_KEY_HEX=$(sudo -u casper cat /etc/casper/validator_keys/public_key_hex)
CHAIN_NAME=$(curl -s http://127.0.0.1:8888/status | jq -r '.chainspec_name')

sudo -u casper casper-client put-deploy \
    --chain-name "$CHAIN_NAME" \
    --node-address "http://127.0.0.1:7777/" \
    --secret-key "/etc/casper/validator_keys/secret_key.pem" \
    --session-path "$HOME/casper-node/target/wasm32-unknown-unknown/release/add_bid.wasm" \
    --payment-amount 7500000000 \
    --gas-price=1 \
    --session-arg=public_key:"public_key='$PUBLIC_KEY_HEX'" \
    --session-arg=amount:"u512='900000000000'" \
    --session-arg=delegation_rate:"u8='1'"
```

#### Argument Explanation
- ```amount``` - This is the amount that is being bid. If the bid wins, this will be the validator’s initial bond amount. Recommended bid in amount is 90% of your faucet balance.  This is ```900 CSPR```  or ```900000000000 motes``` as an argument to the ```add_bid``` contract deploy.
- ```delegation_rate``` - The percentage of rewards that the validator retains from delegators that delegate their tokens to the node.
  
Remember the ```deploy_hash``` returned in the response to query its status later.

### Check that you bonding request worked

Sending a transaction to the network does not mean that the transaction processed successfully. It’s important to check to see that the contract executed properly:

```
casper-client get-deploy --node-address http://127.0.0.1:7777 <DEPLOY_HASH> | jq .result.execution_results
```

Replace ```<DEPLOY_HASH>``` with the deploy hash of the transaction you want to check.

### Query the auction info and look for your bid

To determine if the bid was accepted, execute the following command:

```
casper-client get-auction-info --node-address http://127.0.0.1:7777
```

The bid should appear among the returned ```bids```. If the public key associated with a bid appears in the ```validator_weights``` structure for an era, then the account is bonded in that era.


_Please note that the DEVxDAO's Casper Testnet program is implemented by the [DEVxDAO](https://devxdao.com) by providing rewards 
through the [Emerging Technology Association](https://www.emergingte.ch) (ETA), a Swiss nonprofit association which supports open source 
and transparent scientific research of emerging technologies for community building. 
Any rewards will be granted and calculated by the ETA. MAKE Technology LLC is not affiliated
with the DEVxDAO, the ETA nor the Casper Foundation, and has no control over the program sponsorship or the incentivized
reward program, and is hosting these guides and documents as a service to the DEVxDAO and the Casper community only._
