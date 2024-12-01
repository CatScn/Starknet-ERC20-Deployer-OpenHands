
# Starknet ERC20 Token Deployer

An easy-to-install and deploy tool for deploying an ERC20 token on the Starknet network. &nbsp; \
With a simple installation and deployment process, you can quickly create and customize your ERC20 token on Starknet.
&nbsp;
&nbsp;

&nbsp;

&nbsp;
## 🛠️Prerequisites🛠️

Before using this tool, ensure you have the following installed:

- [Node.js](https://nodejs.org/) (v22.11.0 or higher)
- [curl](https://curl.se/)
- [git](https://git-scm.com/)

Additionally, you'll need a deployed wallet on seploia(testnet) on either [ArgentX](https://www.argent.xyz/) or [Braavos](https://braavos.app/) for a test deployment. \
To deploy a test token and to deploy the wallet on the blockchain you'll need some ETH in your wallet, you can use [blast's free faucet](https://blastapi.io/faucets/starknet-sepolia-eth). &nbsp; \
After your wallet is funded you can procces to set it up on chain (deploy): &nbsp; \
[How to deploy guide for Braavos.](https://braavos.app/faq/setting-up-your-braavos-wallet-easy-starknet-guide/) &nbsp; \
[How to deploy guide for ArgentX.](https://support.argent.xyz/hc/en-us/articles/8802319054237-How-to-activate-deploy-my-Argent-X-wallet#:~:text=To%20deploy%20the%20wallet%2C%20you,to%20your%20own%20wallet%20address.) &nbsp; 

&nbsp;
&nbsp;

## Installation 🦾

To install the Deployer, just run the following command in your terminal:

```bash
curl -k https://raw.githubusercontent.com/CatScan-crypt/Starknet-ERC20-Deployer/refs/heads/main/bash/curlPack.bash | bash
```
This will download and install all necessary files. &nbsp; \
&nbsp;

&nbsp;
Example output: &nbsp; \
![ezgif-5-6658a38e4b](https://github.com/user-attachments/assets/60a99204-7515-4cd3-891c-0b10b6193389)

&nbsp;
&nbsp;

## First Time Deployment🚀 🚀 🚀 

Once the installation is complete, run the following command to deploy the test ERC20 token:

```bash
cd Starknet-ERC20-Deployer && npm run firstDeploy
```

You will be prompted to enter your private key and the address to deploy your token. &nbsp; \
Make sure your wallet is already deployed on sepolia with either [ArgentX](https://www.argent.xyz/) or [Braavos](https://braavos.xyz/).

&nbsp;
&nbsp;
Example first deploy: &nbsp; \
![ezgif-6-4abad87ace](https://github.com/user-attachments/assets/9c697f7d-697d-4730-a550-5eb3c5f9d7e0)

&nbsp;
## Customization📊

After the first test deployment, you can customize your ERC20 token by editing the `.env` file. &nbsp; \
Modify parameters such as token name, symbol, initial supply, etc., to tailor the deployment to your needs. &nbsp; \
Then to deploy your customized token just run:

```bash
npm run deploy
```

&nbsp;
## ✅ TODO ✅

The following features are planned for future updates:

- [ ] Adding an example GIF or video for easier understanding.
- [ ] Verifying the contract on Voyager.
- [ ] Implementing an uninstaller.
- [ ] Adding a CLI (Command Line Interface) for easier configuration.
- [ ] Introducing a component builder for customizing options like **ownable**, **mintable**, **burnable**, etc.
- [ ] Adding Voyager Verifier support for contract verification.
&nbsp;

&nbsp;
## Acknowledgements💖

Special thanks to [robertkodra](https://github.com/robertkodra) for the examples and guidance shared on BasecampX, which helped in the creation of this project. 
&nbsp;
&nbsp;
## License 🔐
This project is licensed under the GNU License - see the [LICENSE](LICENSE) file for details.
&nbsp;
&nbsp;
## Tested Environment
- **OS**: Windows 10 WSL2: Ubuntu 24.04
- **Node.js Version**: v22.11.0


