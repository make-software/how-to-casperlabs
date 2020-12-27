## Run the node

### Get the trusted hash value from an already bonded validator

```
KNOWN_ADDRESSES=$(cat /etc/casper/config.toml | grep known_addresses)
KNOWN_VALIDATOR_IP=$(grep -oE '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' <<< "$KNOWN_ADDRESSES")

curl -s http://$KNOWN_VALIDATOR_IP:7777/status | jq .last_added_block_info.hash
```

### If the hash is not null update trusted_hash property at the top of the config file

```
sudo nano /etc/casper/config.toml
```

### Start the node
sudo systemctl start casper-node

### Monitor the situation

#### Check the node log

```
tail -n100 -f /var/log/casper/casper-node.log
```

#### Check if a known validator sees your node among peers

```
curl -s http://$KNOWN_VALIDATOR_IP:7777/status | jq .peers
```

You should see your IP address on the list

#### Check the node status

```
curl -s http://127.0.0.1:7777/status
```
