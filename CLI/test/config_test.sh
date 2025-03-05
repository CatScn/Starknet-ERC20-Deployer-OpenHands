#!/usr/bin/env bash

SCRIPT_DIR="$(dirname "${BASH_SOURCE[0]}")"

# Execute config.sh commands
"$SCRIPT_DIR/../config.sh" -m get -o DEPLOYER_PRIVATE_KEY
"$SCRIPT_DIR/../config.sh" -m get -o DEPLOYER_ADDRESS
"$SCRIPT_DIR/../config.sh" -m get -o NETWORK
"$SCRIPT_DIR/../config.sh" -m get -o RPC_ENDPOINT_SEPOLIA
"$SCRIPT_DIR/../config.sh" -m get -o RPC_ENDPOINT_MAINNET
"$SCRIPT_DIR/../config.sh" -m get -o TOKEN_NAME
"$SCRIPT_DIR/../config.sh" -m get -o SYMBOL_NAME
"$SCRIPT_DIR/../config.sh" -m get -o DECIMALS_LENGTH
"$SCRIPT_DIR/../config.sh" -m get -o FIXED_SUPPLY
