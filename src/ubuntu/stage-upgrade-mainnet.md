### Stage the upgrades
"Staging an upgrade" is a process in which you tell your node to download the upgrade files and prepare them, so that they can automatically be applied at the pre-defined activation point. Stage all of the following upgrades from the oldest to the newest (from the top to the bottom).

#### Upgrade to casper-node v1.1.1
For this upgrade, to `casper-node v1.1.1`, the activation point is `Era 347`. You have to make sure you have properly staged the upgrade well ahead of the activation point, so that your node will be upgraded on time. You may see the [details of the upgrade on GitHub](https://github.com/casper-network/casper-node/releases/tag/v1.1.1).

Execute the following command to download and stage the upgrade:
```
curl -sSf genesis.casperlabs.io/casper/1_1_0/stage_1_1_0_upgrade.sh | sudo bash
```

#### Upgrade to casper-node v1.1.2
For this upgrade, to `casper-node v1.1.2`, the activation point is `Era 574`. You have to make sure you have properly staged the upgrade well ahead of the activation point, so that your node will be upgraded on time. You may see the [details of the upgrade on GitHub](https://github.com/casper-network/casper-node/releases/tag/v1.1.2).

Execute the following command to download and stage the upgrade:
```
curl -sSf genesis.casperlabs.io/casper/1_1_2/stage_upgrade.sh | sudo bash -
```
