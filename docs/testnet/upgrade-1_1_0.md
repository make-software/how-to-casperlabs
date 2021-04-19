# Upgrade to casper-node v1.1.0

## Introduction and Timing
We are requesting that all Casper Testnet participants stage the upgrade of their nodes to a new version of `casper_node` 
immediately, using the instructions below. "Staging an upgrade" is a process in which you tell your node to download
the upgrade files and prepare them, so that they can automatically be applied at the pre-defined activation point.

For this upgrade, to `casper-node v1.1.0`, the activation point is `Era 166`, which will be approximately around:
* Thursday April 22, 2021 at 15:00 UTC
* Thursday April 22, 2021 at 17:00 CET  
* Thursday April 22, 2021 at 11AM EDT
* Thursday April 22, 2021 at 8AM PDT

In order to not have points deducted for your Testnet reward score, you have to make sure you have properly staged the
upgrade well ahead of the activation point, so that your node will be upgraded on time.

## Upgrade Staging Instructions

The process to upgrade your node is very straightforward. Log in to your node, and execute the following two commands,
one by one:

```shell
sudo -u casper /etc/casper/pull_casper_node_version.sh casper-test.conf 1_1_0
sudo -u casper /etc/casper/config_from_example.sh 1_1_0
```

## Verifying Successful Staging

After you have successfully executed the above commands, you can verify that your node is correctly staged with the
upgrade by taking a look at your `status` end-point, as follows:

```shell
curl -s http://127.0.0.1:8888/status | jq -r
```

This will print the status of your node to your terminal. Towards the end of the JSON output, you will find an object
called `next_upgrade`, which if you successfully staged your upgrade, will have the following structure and values:

```json
  "next_upgrade": {
    "activation_point": 166,
    "protocol_version": "1.1.0"
  },
```

If you see another value here, for example `null`, then your upgrade staging was not executed successfully.


_Please note that the DEVxDAO's Casper Testnet program is implemented by the [DEVxDAO](https://devxdao.com) by providing rewards 
through the [Emerging Technology Association](https://www.emergingte.ch) (ETA), a Swiss nonprofit association which supports open source 
and transparent scientific research of emerging technologies for community building. 
Any rewards will be granted and calculated by the ETA. MAKE Technology LLC is not affiliated
with the DEVxDAO, the ETA nor the Casper Foundation, and has no control over the program sponsorship or the incentivized
reward program, and is hosting these guides and documents as a service to the DEVxDAO and the Casper community only._



