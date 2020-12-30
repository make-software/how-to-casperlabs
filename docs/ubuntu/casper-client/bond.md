If you followed the installation steps from this document you can run the following script to bond. It substitutes the public key hex value for you and sends recommended argument values:

```
KNOWN_ADDRESSES=$(cat /etc/casper/config.toml | grep known_addresses)
KNOWN_VALIDATOR_IPS=$(grep -oE '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' <<< "$KNOWN_ADDRESSES")
IFS=' ' read -r KNOWN_VALIDATOR_IP _REST <<< "$KNOWN_VALIDATOR_IPS"
PUBLIC_KEY_HEX=$(cat /etc/casper/validator_keys/public_key_hex)
CHAIN_NAME=$(curl -s http://$KNOWN_VALIDATOR_IP:8888/status | jq -r '.chainspec_name')

casper-client put-deploy \
    --chain-name "$CHAIN_NAME" \
    --node-address "http://$KNOWN_VALIDATOR_IP:7777/" \
    --secret-key "/etc/casper/validator_keys/secret_key.pem" \
    --session-path "$HOME/casper-node/target/wasm32-unknown-unknown/release/do_bid.wasm" \
    --payment-amount 1000000000 \
    --session-arg=public_key:"public_key='$PUBLIC_KEY_HEX'" \
    --session-arg=amount:"u512='9000000000000000'" \
    --session-arg=delegation_rate:"u64='10'"
```
