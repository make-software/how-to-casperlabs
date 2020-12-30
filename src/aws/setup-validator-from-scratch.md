# Setup delta testnet validator node from scratch on Ubuntu 20.04 on AWS

## Create security group 

Create casperlabs-validator security group that exposes the following ports to public:

- 7777 - rpc port
- 8888 - status port
- 9999 - event stream port
- 35555 - gossip port

## Launch instance 

Launch a m5.xlarge using Ubuntu Server 20.04 LTS AMI with 250 GB EBS volume, attach the casperlabs-validator security group to it

## Create elastic IP

Create elastic IP and assign it to the instance

[include ../ubuntu/setup-validator-from-scratch.md]
