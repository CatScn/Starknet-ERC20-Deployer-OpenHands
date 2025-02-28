# CLI TODO

- [ ] Implement `deploy` command: Deploy a new ERC20 token with customizable parameters.
    - [ ] Implement `--name <token_name>` option: Token name.
    - [ ] Implement `--symbol <token_symbol>` option: Token symbol.
    - [ ] Implement `--initial-supply <initial_supply>` option: Initial token supply.
    - [ ] Implement `--decimals <decimals>` option: Token decimals.
    - [ ] Implement `--private-key <private_key>` option: Wallet private key.
    - [ ] Implement `--account-address <account_address>` option: Wallet account address.
    - [ ] Implement `--network <network>` option: Network to deploy to (e.g., sepolia, mainnet).
    - [ ] Implement `--env-file <path_to_env_file>` option: Load parameters from an environment file.

- [ ] Implement `config` command: Manage project configuration.
    - [ ] Implement `set` subcommand: Set configuration values.
        - [ ] Implement `config set private-key <private_key>`
        - [ ] Implement `config set account-address <account_address>`
        - [ ] Implement `config set network <network>`
    - [ ] Implement `get` subcommand: Get configuration values.
        - [ ] Implement `config get private-key`
        - [ ] Implement `config get account-address`
        - [ ] Implement `config get network`
    - [ ] Implement `init` subcommand: Initialize a new project, creating a default `.env` file.

- [ ] Implement `verify` command: Verify the deployed contract on Voyager.
    - [ ] Implement `--contract-address <contract_address>` option: The address of the deployed contract.
    - [ ] Implement `--network <network>` option: The network the contract is deployed on.

- [ ] Implement `info` command: Display information about the project or deployed token.
    - [ ] Implement `project` subcommand: Display project information (e.g., version, dependencies).
    - [ ] Implement `token` subcommand: Display token information (e.g., name, symbol, supply, contract address).