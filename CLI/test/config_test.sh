#!/usr/bin/env bash

SCRIPT_DIR="$(dirname "${BASH_SOURCE[0]}")"

# Define variables
CONFIG_SCRIPT="$SCRIPT_DIR/../config.sh"
GET_COMMAND="-m get -o"
SET_COMMAND="-m set -o"

echo "testing set"
# Set test values
"$CONFIG_SCRIPT" "$SET_COMMAND" "DEPLOYER_PRIVATE_KEY=0x1122334455667788"  2>/dev/null
"$CONFIG_SCRIPT" "$SET_COMMAND" "DEPLOYER_ADDRESS=0x8877665544332211"  2>/dev/null
"$CONFIG_SCRIPT" "$SET_COMMAND" "NETWORK=testnet"  2>/dev/null
"$CONFIG_SCRIPT" "$SET_COMMAND" "RPC_ENDPOINT_SEPOLIA=https://sepolia.example.com"  2>/dev/null
"$CONFIG_SCRIPT" "$SET_COMMAND" "RPC_ENDPOINT_MAINNET=https://mainnet.example.com"  2>/dev/null
"$CONFIG_SCRIPT" "$SET_COMMAND" "TOKEN_NAME=TestToken" 2>/dev/null
"$CONFIG_SCRIPT" "$SET_COMMAND" "SYMBOL_NAME=TTK"  2>/dev/null
"$CONFIG_SCRIPT" "$SET_COMMAND" "DECIMALS_LENGTH=8"  2>/dev/null
"$CONFIG_SCRIPT" "$SET_COMMAND" "FIXED_SUPPLY=1000000"  2>/dev/null

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
