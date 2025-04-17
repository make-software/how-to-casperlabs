To bond to the network as a validator you need to submit your bid using ```casper-client```:

```
sudo -u casper casper-client put-transaction add-bid \
  --chain-name "<CHAIN_NAME>" \
  --delegation-rate $(( RANDOM % 11 )) \
  --public-key $(cat /etc/casper/validator_keys/public_key_hex) \
  --transaction-amount 10000000000000 \
  --secret-key /etc/casper/validator_keys/secret_key.pem \
  --standard-payment true \
  --payment-amount 2500000000 \
  --gas-price-tolerance 1
```

Where:
- ```transaction-amount``` - This is the amount that is being bid. If the bid wins, this will be the validator’s initial bond amount. The minimum bid amount is ```10000 CSPR```  or ```10000000000000 motes``` as an argument to the ```ad-bid``` transaction. 
- ```delegation-rate``` - The percentage of rewards that the validator retains from delegators that delegate their tokens to the node. The example above sets a random value between 0 (meaning 0%) and 10 (meaning 10%). 
- ```payment-amount``` - The fee in motes (1 CSPR = 10^9 motes) to cover the contract execution cost. It's ```2.5 CSPR```  or ```2500000000 motes``` on the command above.

Replace:
- ```<CHAIN_NAME>``` with the chain name you are joining 

Note down the ```transaction_hash``` returned in the response to query its status later.
