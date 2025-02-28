# CLI Description

This CLI provides the following core functionalities for the Starknet ERC20 Deployer:

## Deployment

*   `deploy`: Deploy a new ERC20 token with customizable parameters.
    *   Options:
        *   `--name <token_name>`: Token name.
        *   `--symbol <token_symbol>`: Token symbol.
        *   `--initial-supply <initial_supply>`: Initial token supply.
        *   `--decimals <decimals>`: Token decimals.
        *   `--private-key <private_key>`: Wallet private key.
        *   `--account-address <account_address>`: Wallet account address.
        *   `--network <network>`: Network to deploy to (e.g., sepolia, mainnet).
        *   `--env-file <path_to_env_file>`: Load parameters from an environment file.

## Configuration

*   `config`: Manage project configuration.
    *   Subcommands:
        *   `set`: Set configuration values.
        *   `get`: Get configuration values.
        *   `init`: Initialize a new project, creating a default `.env` file.

## Verification

*   `verify`: Verify the deployed contract on Voyager.
    *   Options:
        *   `--contract-address <contract_address>`: The address of the deployed contract.
        *   `--network <network>`: The network the contract is deployed on.

## Information

*   `info`: Display information about the project or deployed token.
    *   Subcommands:
        *   `project`: Display project information (e.g., version, dependencies).
        *   `token`: Display token information (e.g., name, symbol, supply, contract address).