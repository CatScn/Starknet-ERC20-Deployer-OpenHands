#!/usr/bin/env bash

set -e

SCRIPT_DIR="$(dirname "${BASH_SOURCE[0]}")"
ENV_FILE="$SCRIPT_DIR/../../.env"

# Load environment variables
load_env() {
  source "$ENV_FILE"
}

# Load environment variables
load_env

# Test setting private-key
"$SCRIPT_DIR/../config_set.sh" -g private-key=test_private_key

# Test setting account-address
"$SCRIPT_DIR/../config_set.sh" -g account-address=test_account_address

# Test setting network
"$SCRIPT_DIR/../config_set.sh" -g network=test_network

# Test setting rpc-endpoint-sepolia
"$SCRIPT_DIR/../config_set.sh" -g rpc-endpoint-sepolia=test_rpc_sepolia

# Test setting rpc-endpoint-mainnet
./config_set.sh -g rpc-endpoint-mainnet=test_rpc_mainnet

echo "All config_set.sh tests completed successfully."
