# Delegating CSPR Stake

## What You'll Need

A compatible wallet with a CSPR balance: either [CasperLabs's Signer](https://chrome.google.com/webstore/detail/casperlabs-signer/djhndpllfiibmcdbnmaaahkhchcoijce) or [Ledger](https://www.ledger.com/). More wallets are planned for the future.

## The Basics

### Connect a Wallet

You can access the wallet Sign In screen by clicking `Sign In` from the top navigation menu. Then choose your Sign In option, either Signer or Ledger:

#### ...Using Signer

1. From the Sign In screen click `Sign In` under the Casper Signer option
2. The Signer app window will open automatically. From the Signer window, when prompted to connect Signer to site, click `Connect` . Then click `Connect` again to approve the connection.
3. Select an account to connect to.

#### ...Using Ledger

1. From the Sign In screen click `Connect` under the Ledger option.
2. Approve the connection when prompted
3. Select the Account that will be used to delegate and click `Add Account` 

### Access Delegate Stake Wizard

Once you've signed in, you can access the Delegate Stake wizard in a few ways. 

* **OPTION 1:** Click `Wallet` from the top navigation menu, then click `Delegate`

* **OPTION 2:** Click `Validator` from the top navigation menu. From the Validator table, click on any Validator to access their details. Click the `Delegate` button.

## Delegate Stake

### Step 1 - Delegation Details

1. Start by choosing which Validator you would like to stake with. If a Validator is not already selected, you can search for one using the Validator search box, or, if you have a Validator in mind, paste their Public Key. 
2. Next, enter the Amount of CSPR you would like to delegate.
3. Click `Next`

### Step 2 - Confirm Details

1. Review the details of the transaction. 
2. Next, enter an Amount. 
3. If everything appears correct, click `Next` . If there is something you wish to change, you can return to the previous step by clicking `Back to Step 1`.

### Step 3 - Sign

1. Click `Sign with Casper Signer`
2. Signer app window opens. Make sure that the Deploy hash in the Signer window matches the Deploy hash in [CSPR.Live](http://cspr.Live) before continuing.
3. Click `Sign` in the Signer window to sign and finalize the transaction.

### Step 4 - Done

The stake delegation initiates as soon as the deploy is signed. You can review the details and status of the deploy by clicking `Deploy Details`.

