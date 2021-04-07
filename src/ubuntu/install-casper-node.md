#### Add Casper repository

Execute the following in order to add the Casper repository to `apt` in Ubuntu. 
```shell
echo "deb https://repo.casperlabs.io/releases" bionic main | sudo tee -a /etc/apt/sources.list.d/casper.list
curl -O https://repo.casperlabs.io/casper-repo-pubkey.asc
sudo apt-key add casper-repo-pubkey.asc
sudo apt update
```

#### Install the Casper node software

```
sudo apt install casper-node-launcher -y
sudo apt install casper-client -y
```
