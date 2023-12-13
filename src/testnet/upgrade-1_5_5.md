# Upgrade to casper-node v1.5.5

## Introduction and Timing
We are requesting that all Casper Testnet participants stage the upgrade of their nodes to a new version of `casper_node`
immediately, using the instructions below. "Staging an upgrade" is a process in which you tell your node to download
the upgrade files and prepare them, so that they can automatically be applied at the pre-defined activation point.

For this upgrade, to `casper-node v1.5.5`, the activation point is `Era 11751`, which will be approximately around:
* Monday December 18, 2023 at 14:51 UTC
* Monday December 18, 2023 at 06:51 US/Pacific
* Monday December 18, 2023 at 09:51 US/Eastern
* Monday December 18, 2023 at 15:51 Europe/Zurich
* Monday December 18, 2023 at 22:51 Asia/Hong_Kong

In order to not have points deducted for your Testnet reward score, you have to make sure you have properly staged the
upgrade well ahead of the activation point, so that your node will be upgraded on time.

## Upgrade Staging Instructions

The process to upgrade your node is very straightforward. Log in to your node, and execute the following two commands,
one by one:

```shell
sudo -u casper /etc/casper/node_util.py stage_protocols casper-test.conf
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
    "activation_point": 11751,
    "protocol_version": "1.5.5"
  },
```

If you see another value here, for example `null`, then your upgrade staging was not executed successfully.

[include ../disclaimer.md]

