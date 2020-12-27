# FAQ

## My node is running but is not visible by peers

Check that you opened the 35555 port in your firewall settings and the node listens to it:

```
sudo netstat -tulpn
```

## I receive {"code":32003,"message":"state query failed: ValueNotFound(\"Failed to find base key at path: Key::Account(...)\")"} when checking the balance

Make sure that you are using the hex representation of the correct public key, and that the key is funded.

## I do not see my bid in the auction info

Check the transaction status to ensure it went through:

Sending a transaction to the network does not mean that the transaction processed successfully. It’s important to check to see that the contract executed properly:

```
casper-client get-deploy --node-address http://<KNOWN_VALIDATOR_IP>:7777 <DEPLOY_HASH> | jq .result.execution_results
```

Replace ```<DEPLOY_HASH>``` with the deploy hash of the transaction you want to check.

Run the following script to get known validator IP:

```
KNOWN_ADDRESSES=$(cat /etc/casper/config.toml | grep known_addresses)
grep -oE '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' <<< "$KNOWN_ADDRESSES"
```

## I do not see my bid in the auction info

Check the transaction status to ensure it went through:

Sending a transaction to the network does not mean that the transaction processed successfully. It’s important to check to see that the contract executed properly:

```
casper-client get-deploy --node-address http://<KNOWN_VALIDATOR_IP>:7777 <DEPLOY_HASH> | jq .result.execution_results
```

Replace ```<DEPLOY_HASH>``` with the deploy hash of the transaction you want to check.

Run the following script to get known validator IP:

```
KNOWN_ADDRESSES=$(cat /etc/casper/config.toml | grep known_addresses)
grep -oE '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' <<< "$KNOWN_ADDRESSES"
```
