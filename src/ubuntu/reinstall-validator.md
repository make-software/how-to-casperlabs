## Reinstall software

### Stop the node if it is running and remove old packages and configuration

[include remove-casper-node.md]

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
