# Update already installed delta testnet validator node on Ubuntu 20.04

> **Note**  
> Do not execute all the commands below as root. sudo is included where it is required. 

## Set version you're going to set up

Set a variable defining the version of the node package you're setting up. For `1.0.0`, use `1_0_0`

```CASPER_VERSION=1_0_0```

Set a variable defining the network name you're trying to set up. For example, for Main Net, use `casper`, while for Test Net use `testnet`

```CASPER_NETWORK=casper```

## Update software

### Stop the node if it is running and remove old packages and configuration

```
sudo systemctl stop casper-node
sudo systemctl stop casper-node-launcher

cd ~
sudo apt remove -y casper-node 
sudo apt remove -y casper-client 
sudo apt remove -y casper-node-launcher

# Clean up old genesis file location
sudo rm /etc/casper/config.*
sudo rm /etc/casper/accounts.csv 
sudo rm /etc/casper/chainspec.toml 
sudo rm /etc/casper/validation.md5
```

### Download and install new node software

[include install-casper-node.md]

[include run-node.md]

## Re-build smart contracts that are required to bond to the network 

### Build smart contracts

#### Get casper-node
If you don't have it yet, clone casper-node:

```
cd ~
git clone https://github.com/CasperLabs/casper-node.git
```

#### Go to the directory with casper-node sources

```
cd ~/casper-node
```

#### Pull the latest changes

```
git fetch
```

[include checkout-release-branch.md]

#### Remove previous builds

```
make clean
```

#### Build the contracts

```
make setup-rs && make build-client-contracts -j
```

## Fund your account

[include ../clarity/fund-account.md]

[include bond.md]
