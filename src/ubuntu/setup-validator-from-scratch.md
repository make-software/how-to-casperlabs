## Install software

### Update package repositories

```
sudo apt update
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

[include remove-casper-node.md]

### Install Casper node

[include install-casper-node.md]
