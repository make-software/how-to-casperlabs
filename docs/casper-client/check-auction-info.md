To determine if the bid was accepted, execute the following command:

```
casper-client get-auction-info --node-address http://<KNOWN_VALIDATOR_IP>:7777
```

The bid should appear among the returned ```bids```. If the public key associated with a bid appears in the ```validator_weights``` structure for an era, then the account is bonded in that era.
