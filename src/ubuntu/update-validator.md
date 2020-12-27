# Update already installed delta testnet validator node on Ubuntu 20.04

> **Note**  
> Do not execute all the commands below as root. sudo is included where it is required. 

## Update software

### Stop the node if it is running

```
sudo systemctl stop casper-node
```

### Back-up your old config

```
sudo mv /etc/casper/config.toml /etc/casper/config.toml.old
```

### Remove previously installed node software

```
sudo apt remove -y casper-client casper-node
```

### Install new node software

[include install-casper-node.md]

## Re-build smart contracts that are required to bond to the network 

### Build smart contracts

#### Go to the directory with casper-node sources

```
cd ~/casper-node
```

#### Pull the latest changes

```
git pull
```

[include checkout-release-branch.md]

#### Remove previous builds

```
make clean
```

#### Build the contracts

```
make setup-rs
make build-client-contracts -j
```

## Fund your account

[include ../clarity/fund-account.md]

## Clean up after the previous run

### Rotate logs

```
sudo logrotate -f /etc/logrotate.d/casper-node
```

### Delete the database from the previous run

```
sudo /etc/casper/delete_local_db.sh
```

[include run-node.md]

[include bond.md]
