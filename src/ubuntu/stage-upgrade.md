### Stage the upgrades
"Staging an upgrade" is a process in which you tell your node to download the upgrade files and prepare them, so that they can automatically be applied at the pre-defined activation point. Stage all of the following upgrades from the
oldest to the newest (from the top to the bottom).

#### Upgrade to casper-node v1.1.0
For this upgrade, to `casper-node v1.1.0`, the activation point is `Era 166`. In order to not have points deducted for your Testnet reward score, you have to make sure you have properly staged the upgrade well ahead of the activation point, so that your node will be upgraded on time.

Execute the following two commands, one by one:
```
sudo -u casper /etc/casper/pull_casper_node_version.sh casper-test.conf 1_1_0
sudo -u casper /etc/casper/config_from_example.sh 1_1_0
```

#### Upgrade to casper-node v1.1.2
For this upgrade, to `casper-node v1.1.2`, the activation point is `Era 388`. In order to not have points deducted for your Testnet reward score, you have to make sure you have properly staged the upgrade well ahead of the activation point, so that your node will be upgraded on time.

Execute the following two commands, one by one:
```
sudo -u casper /etc/casper/pull_casper_node_version.sh casper-test.conf 1_1_2
sudo -u casper /etc/casper/config_from_example.sh 1_1_2
```

#### Upgrade to casper-node v1.2.0
For this upgrade, to `casper-node v1.2.0`, the activation point is `Era 490`. In order to not have points deducted for your Testnet reward score, you have to make sure you have properly staged the upgrade well ahead of the activation point, so that your node will be upgraded on time.

Execute the following two commands, one by one:
```
sudo -u casper /etc/casper/pull_casper_node_version.sh casper-test.conf 1_2_0
sudo -u casper /etc/casper/config_from_example.sh 1_2_0
```

#### Upgrade to casper-node v1.2.1
For this upgrade, to `casper-node v1.2.1`, the activation point is `Era 1143`. In order to not have points deducted for your Testnet reward score, you have to make sure you have properly staged the upgrade well ahead of the activation point, so that your node will be upgraded on time.

Execute the following two commands, one by one:
```
sudo -u casper /etc/casper/pull_casper_node_version.sh casper-test.conf 1_2_1
sudo -u casper /etc/casper/config_from_example.sh 1_2_1
```

#### Upgrade to casper-node v1.3.1
For this upgrade, to `casper-node v1.3.1`, the activation point is `Era 1346`. In order to not have points deducted for your Testnet reward score, you have to make sure you have properly staged the upgrade well ahead of the activation point, so that your node will be upgraded on time.

Execute the following two commands, one by one:
```
sudo -u casper /etc/casper/pull_casper_node_version.sh casper-test.conf 1_3_1
sudo -u casper /etc/casper/config_from_example.sh 1_3_1
```
