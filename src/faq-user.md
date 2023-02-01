# Frequently Asked Questions (FAQ) for the Users of CSPR.Live

## What is delegation?

Delegation allocates your CSPR tokens to a chosen validator on the network who is participating in the Casper Network's Consensus Protocol. As a proof of stake network, node operators 'stake' their tokens to earn the eligibility to propose new blocks for the network and approve blocks proposed by other validators, but require constant uptime and monitoring of a server connected the Casper Network, instead of 'mining' like other tokens.

Instead of having to operate and maintain a Casper node (server that stores a copy of the blockchain), you can instead delegate your tokens to someone on the network who has indicated they intend to operate a server on the network. These server operators are called Validators, and they keep a certain percentage of rewards generated from your staked tokens, similar to a commission. Validators set their own fee, as well as earn rewards for their own staked tokens. By particitating in the protocol this way, you help to improve decentralization and security of the network, and earn rewards in return.

## How frequently the staking rewards are paid?

Staking rewards are paid to your account on a per ERA basis. One Era is currently set to 2 hours, and each block is set for 65 seconds. For the first reward to appear after delegation/staking, it may take upto 2 ERAs (~4 hours).

## I've delegated my tokens but the rewards don't arrive at my wallet?

The rewards are automatically added to your current stake on the corresponding validator. You may observe them under the Rewards tab on your account details page on cspr.live. For the first reward to appear after delegation/staking, it may take up to 2 ERAs (~4 hours).

## Is there a cool-down/lock period after delegation?

While there is a delay before you can access your previously delegated tokens, there is no cool-down or lock period after you delegate tokens. You can undelegate any amount of tokens at any time. Upon undelegating tokens from a validator, the network puts funds on hold for 7 Eras, approximately 14 hours and then automatically returns the CSPR tokens to your account.

## Is there slashing? Can I lose my delegated tokens?

Currently, slashing is not enabled on the Casper MainNet. If a validator behaves poorly on the network they may be evicted from the auction and you will not earn rewards during the period that the validator is evicted. When slashing is enabled, tokens will be removed as penalty for poor/malicious behavior in the network. In that case, you will lose tokens delegated to that validator. 

## What is the cost of delegation and undelegation?

The cost of the delegation process is ~3 CSPR. So make sure you have a bunch of extra CSPR on your account apart from the amount you are delegating. So if you are going to delegate 1000 CSPR, you should have at least 1003 CSPR in your wallet.The cost of the undelegate process is currently ~0.5 CSPR.

## What is the yearly reward rate for the delegated tokens?

The base annual reward rate is 8% of the total supply, resulting in a current APY of approximately 20% on the MainNet (because only a portion of the total supply is currently staked and participating in the reward distribution). The APY is likely to decrease over time as more tokens get staked on the network.

## I see some validators with big stake producing blocks, and some smaller ones not. Does that mean only the bigger ones are getting rewards?

No. On Casper Mainnet, everyone gets seigniorage according to their stake, regardless of whether you've produced blocks or not. The only thing a block proposer gets, is to keep the transaction fees associated with transfers and deploys in the block they proposed. As you may know, transfers cost only 10000 motes (0.00001 CSPR), so these fees are not substantial on a transfer-by-transfer basis.

The block proposer is chosen also based on odds relative to stake, so if you have 0.1% of stake on the network, the odds that you'll get chosen as the block proposer are very small. This has nothing to do with seigniorage.

## Some top validators have a commission rate of 100%. What does that mean?

Validators with Delegation rate of 100 are ones that either don't want to or are restricted from acting as a staking service. You will earn nothing from them.

## Which algorithm should I choose while creating a new account on Signer?

There are two different encryption algorithms that the Casper Network supports.

* `Ed25519` is fast and provides a high level of security with foolproof session keys, among other features. It is the default algorithm used while creating new accounts by the Casper client.
* `Secp256k1` is an efficient encryption algorithm, also used by Bitcoin and Ethereum. If you would like to derive Ethereum or Bitcoin keys in the future using your private key, then go with the Secp256k1 algorithm.

## How can I delegate my tokens?

An easy, web-based staking UI is now available on [CSPR.Live](https://cspr.live). You may follow these steps to delegate your tokens:

1. [Install Casper Signer](https://docs.cspr.community/docs/user-guides/SignerGuide.html)
2. Transfer funds to your wallet on the Signer app
3. [Delegate your CSPR stake](https://docs.cspr.community/docs/user-guides/Delegating-CSPR-Stake.html)
