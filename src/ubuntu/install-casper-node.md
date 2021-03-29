> **Note**  
> Different networks (e.g. Main Net, Test Net) may use different binaries, and the versions references below may be 
> outdated, or not appropriate for the network you're trying to join. First verify the binary version you need
> before installing!
> 
> The binaries below are for Casper Node v0.9.4, pre-main-net

```
cd ~
curl -JLO https://bintray.com/casperlabs/debian/download_file?file_path=casper-node-launcher_0.3.2-0_amd64.deb
curl -JLO https://bintray.com/casperlabs/debian/download_file?file_path=casper-client_0.9.4-0_amd64.deb
sudo apt install -y ./casper-node-launcher_0.3.2-0_amd64.deb ./casper-client_0.9.4-0_amd64.deb
```
