# Frequently Asked Questions (FAQ)

## My node is running but is not visible by peers

Check that you opened the 35000 port in your firewall settings and the node listens to it:

```
sudo ss -lntp
```

## I receive {"code":32003,"message":"state query failed: ValueNotFound(\"Failed to find base key at path: Key::Account(...)\")"} when checking the balance

Make sure that you are using the hex representation of the correct public key, and that the key is funded.

## I receive "ApiError::Transfer [14]" in my bid transaction status

Make sure you bid less than you have in your account. In case you bid all you have then you didn't leave anything to pay for the transaction execution, make sure to leave fund to pay for transaction. 

## I do not see my bid in the auction info

Make sure that:
- you sent your bid to the correct chain (```--chain-name``` argument)

If the request was correct, check the transaction status to ensure it went through.
[include casper-client/check-transaction-status.md]

## How do I estimate execution cost?

The ```chainspec.toml``` file contains costs for every function call or operation, as well as memory and space usage. However, it is rather complicated to estimate the cost that way. 

Right now, estimation would be done by exercising contracts against the Testnet. Casperlabs team intends to do this exercise for all the important contracts they provide. The results will end up as an addendum to online documentation.

## The setup instructions have `CASPER_VERSION=1_0_0` but the current version on the test net is different (i.e. `1.2.0`). Should I change this value to reflect the latest version and directly install that version?
No. Do the normal installation for version `1.0.0` up to the `start your node` step, then stage the upgrades in order, one by one, let your node catch up with the network, then do the bonding. (Instructions already cover all of these steps.)

## I did the bonding request as instructed, but it failed with the status of "Out of gas error".
Increase the value of the `--payment-amount` parameter in the bonding request. As of version `1.2.0`, bids and delegations cost ~3 CSPR.

## Can I move my node to a different machine/location/IP-address?
Yes. You may follow these steps:
* Backup the contents of the `/etc/casper/validator_keys` directory from your old node.
* Do an install from scratch at the new location/machine by following the usual instructions until the point of validator key creation.
* Copy the contents of the `/etc/casper/validator_keys` directory from the old node to the new node at the same location.
* Stop the old node: `sudo systemctl stop casper-node-launcher` (You can now shutdown the old node completely.)
* Continue following the usual instructions until the point of bonding for the new node.
* Wait for the new node to catch up with the network.
* Make sure its status is active on cspr.live
* If you find that you're no longer in the list of Validators but expected to be, you may have been `evicted` because your validator node was not participating in consensus for an era. If you want to rejoin, you need to "reactivate your bid" using the following commands:

  `CHAIN_NAME=$(curl -s http://127.0.0.1:8888/status | jq -r '.chainspec_name')`

  `sudo -u casper casper-client put-deploy --secret-key /etc/casper/validator_keys/secret_key.pem --chain-name "$CHAIN_NAME" --session-path ~/casper-node/target/wasm32-unknown-unknown/release/activate_bid.wasm --payment-amount 300000000 --session-arg "validator_public_key:public_key='$(cat /etc/casper/validator_keys/public_key_hex)'"`

## Is this an incentivised test net? If so, what are the rules for the reward calculation?
All information about the reward program is here: [https://docs.cspr.community/docs/testnet-rewards.html](https://docs.cspr.community/docs/testnet-rewards.html)

## Where is the faucet to get test net tokens?
[https://testnet.cspr.live/tools/faucet](https://testnet.cspr.live/tools/faucet)

## I see that some nodes have much more tokens bonded/delegated than what I have on my node. Does it mean they will get more rewards?
No. Number of tokens on your node or being in top-100 based on the number of tokens on your node doesn’t mean anything for reward calculation. Primary criteria for successful participation is the uptime. See here for more information: [https://docs.cspr.community/docs/testnet-rewards.html](https://docs.cspr.community/docs/testnet-rewards.html)

## How can I make sure my node is perceived as up & running for reward calculation?
* Go to this address in a browser and take note of the `height` value at the bottom of the page: `http://IP-ADDRESS-OF-YOUR-NODE:8888/status`
* Now go to this address: `https://testnet.cspr.live/validator/PUBLIC-HASH-OF-YOUR-NODE`
* Make sure that you see the `ACTIVE` (green) label on your node’s page on testnet.cspr.live, and the `LATEST BLOCK HEIGHT` value at the top of the page is the same as the height value from your node’s status output (you took note of that at the first step). (+-3 difference between these values is okay.)

## I've followed the instructions to install my node, but I'm seeing a lot of warnings on the logs about dropping connections and network mismatch. Is that expected?
Yes. Don't worry about them. When a node from the mainnet tries to connect to another node on the testnet -or the other way around-, the connection gets dropped, causing such warning messages.
