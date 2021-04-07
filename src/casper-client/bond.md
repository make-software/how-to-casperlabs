To bond to the network as a validator you need to submit your bid using ```casper-client```:

```
sudo -u casper casper-client put-deploy \
        --chain-name "<CHAIN_NAME>" \
        --node-address "http://127.0.0.1:7777/" \
        --secret-key "/etc/casper/validator_keys/secret_key.pem" \
        --session-path "$HOME/casper-node/target/wasm32-unknown-unknown/release/add_bid.wasm" \
        --payment-amount 1000000000 \
        --gas-price=1 \
        --session-arg=public_key:"public_key='<PUBLIC_KEY_HEX>'" \
        --session-arg=amount:"u512='900000000000'" \
        --session-arg=delegation_rate:"u8='10'"
```

Where:
- ```amount``` - This is the amount that is being bid. If the bid wins, this will be the validator’s initial bond amount. Recommended bid in amount is 90% of your faucet balance.  This is ```900 CSPR```  or ```900000000000 motes``` as an argument to the ```add_bid``` contract deploy. 
- ```delegation_rate``` - The percentage of rewards that the validator retains from delegators that delegate their tokens to the node.

Replace:
- ```<CHAIN_NAME>``` with the chain name you are joining
- ```<PUBLIC_KEY_HEX>``` with the hex representation of you public key 

Remember the ```deploy_hash``` returned in the response to query its status later.
