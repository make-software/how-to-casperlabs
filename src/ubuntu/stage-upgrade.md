### Stage the upgrades
"Staging an upgrade" is a process in which you tell your node to download the upgrade files and prepare them, so that they can automatically be applied at the pre-defined activation point.

#### Upgrade to casper-node v1.1.0
For this upgrade, to `casper-node v1.1.0`, the activation point is `Era 166`. In order to not have points deducted for your Testnet reward score, you have to make sure you have properly staged the upgrade well ahead of the activation point, so that your node will be upgraded on time.

Execute the following two commands, one by one:
```
sudo -u casper /etc/casper/pull_casper_node_version.sh casper-test.conf 1_1_0
sudo -u casper /etc/casper/config_from_example.sh 1_1_0
```
