# Frequently Asked Questions (FAQ)

## My node is running but is not visible by peers

Check that you opened the 35000 port in your firewall settings and the node listens to it:

```
sudo netstat -tulpn
```

## I receive {"code":32003,"message":"state query failed: ValueNotFound(\"Failed to find base key at path: Key::Account(...)\")"} when checking the balance

Make sure that you are using the hex representation of the correct public key, and that the key is funded.

## I receive "ApiError::Transfer [14]" in my bid transaction status

Make sure you bid less than you have in your account. In case you bid all you have then you didn't leave anything to pay for the transaction execution, make sure to leave fund to pay for transaction. 

## I do not see my bid in the auction info

Make sure that:
- you sent your bid to the correct chain (```--chain-name``` argument)

If the request was correct, check the transaction status to ensure it went through.
Sending a transaction to the network does not mean that the transaction processed successfully. It’s important to check to see that the contract executed properly:

```
casper-client get-deploy --node-address http://<KNOWN_VALIDATOR_IP>:7777 <DEPLOY_HASH> | jq .result.execution_results
```

Replace ```<DEPLOY_HASH>``` with the deploy hash of the transaction you want to check.
