# Setup Test Net validator node from scratch on Ubuntu 20.04 on AWS

[include ../testnet/testnet-warning.md]

## Create security group 

Create ```casperlabs-validator``` security group that exposes the following ports to public:

- ```7777``` - rpc port
- ```8888``` - status port
- ```9999``` - event stream port
- ```35000``` - gossip port

## Launch instance 

Launch an appropriately powered instance using Ubuntu Server 20.04 LTS AMI and at least a 2TB EBS volume, and attach the ```casperlabs-validator``` security group to it

## Create elastic IP

Create elastic IP and assign it to the instance

[include ../ubuntu/setup-testnet-validator-from-scratch.md]

