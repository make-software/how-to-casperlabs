# Delegating CSPR Stake

## What You'll Need

A compatible wallet with a CSPR balance: [Casper Signer](https://chrome.google.com/webstore/detail/casperlabs-signer/djhndpllfiibmcdbnmaaahkhchcoijce). More wallets, including Ledger, are planned for the future.

## The Basics

### Connect a Wallet

You can access the wallet Sign In screen by clicking `Sign In` from the top navigation menu of [CSPR.Live](https://cspr.live). Then follow these steps to sign in using the Signer app:

1. From the Sign In screen, click `Sign In` under the Casper Signer option.

    ![CSPR Live - Casper Signer Option](../../assets/Connect-a-Wallet/00-CSPR-Live-Casper-Signer-Option.png)

2. The Signer app window will open automatically. From the Signer window, when prompted to connect Signer to site, click `Connect`.

    ![Casper Signer - Connect to Site](../../assets/Connect-a-Wallet/01-Casper-Signer-Connect-to-Site-01.png)

3. Then click `Connect` again to approve the connection.

    ![Casper Signer - Approve Connection](../../assets/Connect-a-Wallet/02-Casper-Signer-Approve-Connection.png)

4. Now, you can change the connected account by using the hamburger menu of the Signer app if you like. Notice that ✔️ indicates the active account.

    ![Casper Signer - Hamburger Menu with Multiple Accounts](../../assets/Connect-a-Wallet/03-Casper-Signer-Hamburger-Menu-with-Multi-Account.png)

### Access Delegate Stake Wizard

Once you've signed in to [CSPR.Live](https://cspr.live), you can access the Delegate Stake wizard in a few ways.

* **OPTION 1:** Click `Wallet` from the top navigation menu, then click `Delegate`

* **OPTION 2:** Click `Validators` from the top navigation menu. From the Validators table, click on any Validator to access their details. Click the `Delegate` button.

## Delegate Stake

### Step 1 - Delegation Details

1. Start by choosing which Validator you would like to stake with. If a Validator is not already selected, you can search for one using the Validator search box, or, if you have a Validator in mind, paste their Public Key. 
2. Next, enter the Amount of CSPR you would like to delegate.
3. Click `Next`.

### Step 2 - Confirm Details

1. Review the details of the transaction. 
2. Next, enter an Amount. 
3. If everything appears correct, click `Next`. If there is something you wish to change, you can return to the previous step by clicking `Back to Step 1`.

### Step 3 - Sign

1. Click `Sign with Casper Signer`
2. Signer app window opens. Make sure that the Deploy hash in the Signer window matches the Deploy hash in [CSPR.Live](https://cspr.Live) before continuing.
3. Click `Sign` in the Signer window to sign and finalize the transaction.

### Step 4 - Done

The stake delegation initiates as soon as the deploy is signed. You can review the details and status of the deploy by clicking `Deploy Details`.

