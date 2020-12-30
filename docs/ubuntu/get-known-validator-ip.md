If you followed the installation steps from this document you can run the following script to get a known validator IP:

```
KNOWN_ADDRESSES=$(cat /etc/casper/config.toml | grep known_addresses)
```
