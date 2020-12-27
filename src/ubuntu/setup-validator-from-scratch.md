# Setup delta testnet validator node from scratch on Ubuntu 20.04

> **Note**  
> Do not execute all the commands below as root. sudo is included where it is required. 

## Install software

### Install pre-requisites

```
sudo apt install dnsutils
```

The node uses ```dig``` to get external IP for autoconfig during the installation process

### Install helpers

```
sudo apt install jq
```

We will use ```jq``` to process JSON responses from API later in the process

### Install Casperlabs node

[include install-casper-node.md]

## Build smart contracts that are required to bond to the network 

### Install pre-requisites for building smart contracts

```
sudo apt purge --auto-remove cmake
wget -O - https://apt.kitware.com/keys/kitware-archive-latest.asc 2>/dev/null | gpg --dearmor - | sudo tee /etc/apt/trusted.gpg.d/kitware.gpg >/dev/null
sudo apt-add-repository 'deb https://apt.kitware.com/ubuntu/ focal main'   
sudo apt update
sudo apt install cmake

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

sudo apt install libssl-dev
sudo apt install pkg-config
sudo apt install build-essential
```

### Build smart contracts

#### Pull sources

Go to your home directory and clone the node repository. Later we will use this path to the smart contracts in our bonding request.

```
cd ~

git clone git://github.com/CasperLabs/casper-node.git
cd casper-node/
```

[include checkout-release-branch.md]

#### Build the contracts:

```
make setup-rs
make build-client-contracts -j
```

## Generate keys and fund your account 

### Generate node keys

[include generate-keys.md]

### Create account

[include ../clarity/create-account.md]

### Fund account

[include ../clarity/fund-account.md]


[include run-node.md]

[include bond.md]
