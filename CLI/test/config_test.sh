#!/usr/bin/env bash

SCRIPT_DIR="$(dirname "${BASH_SOURCE[0]}")"

echo "testing set"
# Set test values
"$SCRIPT_DIR/../config.sh" -m set -o "DEPLOYER_PRIVATE_KEY=0x1122334455667788"
"$SCRIPT_DIR/../config.sh" -m set -o "DEPLOYER_ADDRESS=0x8877665544332211"
"$SCRIPT_DIR/../config.sh" -m set -o "NETWORK=testnet"
"$SCRIPT_DIR/../config.sh" -m set -o "RPC_ENDPOINT_SEPOLIA=https://sepolia.example.com"
"$SCRIPT_DIR/../config.sh" -m set -o "RPC_ENDPOINT_MAINNET=https://mainnet.example.com"
"$SCRIPT_DIR/../config.sh" -m set -o "TOKEN_NAME=TestToken"
"$SCRIPT_DIR/../config.sh" -m set -o "SYMBOL_NAME=TTK"
"$SCRIPT_DIR/../config.sh" -m set -o "DECIMALS_LENGTH=8"
"$SCRIPT_DIR/../config.sh" -m set -o "FIXED_SUPPLY=1000000"

echo "testing get"

# Get all values
"$SCRIPT_DIR/../config.sh" -m get -o DEPLOYER_PRIVATE_KEY
"$SCRIPT_DIR/../config.sh" -m get -o DEPLOYER_ADDRESS
"$SCRIPT_DIR/../config.sh" -m get -o NETWORK
"$SCRIPT_DIR/../config.sh" -m get -o RPC_ENDPOINT_SEPOLIA
"$SCRIPT_DIR/../config.sh" -m get -o RPC_ENDPOINT_MAINNET
"$SCRIPT_DIR/../config.sh" -m get -o TOKEN_NAME
"$SCRIPT_DIR/../config.sh" -m get -o SYMBOL_NAME
"$SCRIPT_DIR/../config.sh" -m get -o DECIMALS_LENGTH
"$SCRIPT_DIR/../config.sh" -m get -o FIXED_SUPPLY
