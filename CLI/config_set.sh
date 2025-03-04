#!/usr/bin/env bash

# Load environment variables
load_env() {
  source "$(pwd)/.env"
}

# Load environment variables
load_env

# Parse flags
while getopts "g:" opt; do
  case $opt in
    g)
      option_and_value="$OPTARG"
      option="${option_and_value%=*}"
      value="${option_and_value#*=}"
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      exit 1
      ;;
    :)
      echo "Option -$OPTARG requires an argument." >&2
      exit 1
      ;;
  esac
done

# Set config option
case "$option" in
  "private-key")
    sed -i "s/^DEPLOYER_PRIVATE_KEY=.*/DEPLOYER_PRIVATE_KEY=$value/" .env
    ;;
  "account-address")
    sed -i "s/^DEPLOYER_ADDRESS=.*/DEPLOYER_ADDRESS=$value/" .env
    ;;
  "network")
    sed -i "s/^NETWORK=.*/NETWORK=$value/" .env
    ;;
  "rpc-endpoint-sepolia")
    sed -i "s/^RPC_ENDPOINT_SEPOLIA=.*/RPC_ENDPOINT_SEPOLIA=$value/" .env
    ;;
  "rpc-endpoint-mainnet")
    sed -i "s/^RPC_ENDPOINT_MAINNET=.*/RPC_ENDPOINT_MAINNET=$value/" .env
    ;;
  *)
    echo "Invalid option: $option"
    exit 1
    ;;
esac

load_env # Reload environment variables after modification
