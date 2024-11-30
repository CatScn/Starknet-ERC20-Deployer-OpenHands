```markdown
# Starknet ERC20 Deployer

An easy-to-install and deploy tool for deploying an ERC20 token on the Starknet network. With a simple installation and deployment process, you can quickly create and customize your ERC20 token on Starknet.

## Installation

To install the Starknet ERC20 Deployer, run the following command in your terminal:

```bash
curl -k https://raw.githubusercontent.com/CatScan-crypt/Starknet-ERC20-Deployer/refs/heads/main/bash/curlPack.bash | bash
```

This will download and install all necessary files.

## First Time Deployment

Once the installation is complete, navigate to the `Starknet-ERC20-Deployer` folder and run the following command to deploy your first ERC20 token:

```bash
cd Starknet-ERC20-Deployer && npm run firstDeploy
```

You will be prompted to enter your private key and the address to deploy your token. Make sure your wallet is already deployed on [ArgentX](https://www.argent.xyz/) or [Braavos](https://braavos.xyz/).

## Customization

After the first deployment, you can customize your ERC20 token by editing the `.env` file. Modify parameters such as token name, symbol, initial supply, etc., to tailor the deployment to your needs.

## Prerequisites

Before using this tool, ensure you have the following installed:

- [Node.js](https://nodejs.org/) (v22.11.0 or higher)
- [curl](https://curl.se/)
- [git](https://git-scm.com/)

Additionally, you'll need a deployed wallet on either [ArgentX](https://www.argent.xyz/) or [Braavos](https://braavos.xyz/).

## Tested Environment

- **OS**: Windows 10 WSL2: Ubuntu 24.04
- **Node.js Version**: v22.11.0

## Roadmap

The following features are planned for future updates:

- Adding an example GIF or video for easier understanding.
- Verifying the contract on Voyager.
- Implementing an uninstaller.
- Adding a CLI (Command Line Interface) for easier configuration.
- Introducing a component builder for customizing options like **ownable**, **mintable**, **burnable**, etc.
- Adding Voyager Verifier support for contract verification.

## Acknowledgements

Special thanks to [robertkodra](https://github.com/robertkodra) for the examples and guidance shared on BasecampX, which helped in the creation of this project. 

## License

This project is licensed under the GNU License - see the [LICENSE](LICENSE) file for details.
```
