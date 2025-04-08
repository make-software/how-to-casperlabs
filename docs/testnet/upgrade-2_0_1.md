# Upgrade to casper-node v2.0.1

## Introduction and Timing
We are requesting that all Casper Testnet participants stage the upgrade of their nodes to a new version of `casper_node`
immediately, using the instructions below. "Staging an upgrade" is a process in which you tell your node to download
the upgrade files and prepare them, so that they can automatically be applied at the pre-defined activation point.

For this upgrade, to `casper-node v2.0.1`, the activation point is `Era 17497`, which will be approximately around Thursday, April 10, 2025 at 14:46 UTC.

Please make sure you have properly staged the upgrade well ahead of the activation point, so that your node will be upgraded on time.

## Upgrade Staging Instructions

The process to upgrade your node is very straightforward. Log in to your node, and execute the following command:

```shell
sudo -u casper /etc/casper/node_util.py stage_protocols casper-test.conf
```

## Verifying Successful Staging

After you have successfully executed the above command, you can verify that your node is correctly staged with the
upgrade by taking a look at the output of the following command to make sure it has the 
`Next Upgrade: {'activation_point': 17497, 'protocol_version': '2.0.1'}` `status` line:

```shell
/etc/casper/node_util.py watch
```

If you don't see the `Next Upgrade` line here, then your upgrade staging was not executed successfully.


_Please note that the Casper Testnet program is implemented by providing rewards
through the [Casper Association](https://casper.network) (CA), a not-for-profit, Switzerland-domiciled organization
responsible for overseeing the Casper network and supporting its organic evolution and continued decentralization.
MAKE Technology LLC is not affiliated with the Casper Association, and has no control over the program sponsorship or the incentivized
reward program, and is hosting these guides and documents as a service to the Casper community only._

