# Casper Testnet Rewards

## Introduction

Thank you for participating in the Casper Testnet program. Your voluntary participation in this Testnet is enabling 
stakeholders across the Casper eco-system, including core node developers, validators, dApp developers and tool developers,
to test their software in a non-production environment, and to preview upcoming software changes. 
As announced at the onset of the Testnet program, it is planned to award rewards to Testnet participants, contingent
upon their adherence to the [Code of Conduct](testnet.md), based on an algorithmically calculated score that incorporates
certain performance criteria (see below), and subject to certain limits and final approval.

## Reward Calculation

### Principles

* Rewards are calculated on a weekly basis, beginning with the first full week after Testnet Genesis, i.e. the week starting 
  Monday April 12th, 2021.
* Weeks begin on Monday at 0:00:00 UTC, and end on Sunday at 23:59:59 UTC.
* Rewards are awarded to the top-ranked `n` of Testnet participants in a given week:
    * `n` is subject to a future vote of the DEVxDAO
    * the ranking each week is calculated as explained below 
    * all participants tied for the last reward-eligible position will be awarded
* Rewards are accrued and paid at a later date, subject to Casper token lock-up periods and Casper Association's workflow and grant specifics
* The total reward amount available to the program is subject to a change as needed with a prior announcement
* Reward participation is contingent upon completing a KYC/AML process, details for which will be announced at a later date.
* One KYC'd person can only be tied to one node, for reward purposes.

### Weekly Reward Calculation

The basic scoring algorithm is:

```shell
100 * uptime_percentage
```
where `uptime_percentage` is defined as your node running within 4 blocks from the "tip" of the blockchain. Your node is regularly scanned
on port `8888` to check your block height, so if your port `8888` is closed, you are automatically not considered "up". `uptime_percentage`
is calculated on a 24-hour basis, during each UTC day. 

#### Longevity Score

The he longevity score is the cumulative daily score of a node since the last fault. Any day with a score below 90 is considered a fault.

Network longevity at 100% will be used as a factor to break ties (longer longevity=higher ranking among tied performance metrics) and where a tie causes the rewardee list to exceed 100 rewardees, the list will either be shortened to exclude all tied rewardees, or extended up to 110 rewardees, whichever results in fewer rewardee additions/removals.

#### Deductions

Your cumulative weekly score can be reduced if any of the following events occur:

##### Network Weight

If your node at any time during the weekly calculation period has a network weight of 6% or more, your score for that 
week will be reduced by 10%.

##### Validator Bid

If your node does not have an active bid on the network, it will be considered down, and will not be eligible for rewards. If you follow the installation instructions completely, you will have an active bid. Please see the [Validator FAQ](https://docs.cspr.community/docs/faq-validator.html) for more details on how to monitor your node's bid status, and how to reactivate your bid if it gets deactivated.

##### Node Software Version

If your node is not running the expected casper-node software version by the `era` following the `era` that a software
upgrade is slated to take effect, your score for that week will be reduced by 10%. As an example, if a software upgrade is
slated for `era 234` and your node is still not upgraded at the beginning of `era 235`, you will lose 10% of your score.


_Please note that the DEVxDAO's Casper Testnet program is implemented by the [DEVxDAO](https://devxdao.com) by providing rewards 
through the [Emerging Technology Association](https://www.emergingte.ch) (ETA), a Swiss nonprofit association which supports open source 
and transparent scientific research of emerging technologies for community building. 
Any rewards will be granted and calculated by the ETA. MAKE Technology LLC is not affiliated
with the DEVxDAO, the ETA nor the Casper Foundation, and has no control over the program sponsorship or the incentivized
reward program, and is hosting these guides and documents as a service to the DEVxDAO and the Casper community only._
