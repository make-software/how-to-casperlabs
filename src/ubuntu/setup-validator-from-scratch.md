## Install software

### Update package repositories

```
sudo apt-get update
```

### Install pre-requisites

```
sudo apt install dnsutils -y
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

git clone git://github.com/CasperLabs/casper-node.git
cd casper-node/
```

[include checkout-release-branch.md]

#### Build the contracts

```
make setup-rs
make build-client-contracts -j
```
