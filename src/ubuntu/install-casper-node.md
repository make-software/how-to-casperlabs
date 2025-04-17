#### Add Casper repository

Execute the following in order to add the Casper repository to `apt` in Ubuntu. 
```shell
sudo mkdir -m 0755 -p /etc/apt/keyrings/
sudo curl https://repo.casper.network/casper-repo-pubkey.gpg --output /etc/apt/keyrings/casper-repo-pubkey.gpg
echo "deb [arch=amd64 signed-by=/etc/apt/keyrings/casper-repo-pubkey.gpg] https://repo.casper.network/releases focal main" | sudo tee -a /etc/apt/sources.list.d/casper.list
sudo apt update
```

#### Install the Casper node software

```
sudo apt install -y casper-node-launcher casper-client
```
