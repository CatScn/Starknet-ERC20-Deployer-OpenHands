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
      get_option="$OPTARG"
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

# Get config option
case "$get_option" in
  "private-key")
    echo "$DEPLOYER_PRIVATE_KEY"
    ;;
  "account-address")
    echo "$DEPLOYER_ADDRESS"
    ;;
  "network")
    echo "$NETWORK"
    ;;
  "rpc-endpoint-sepolia")
    echo "$RPC_ENDPOINT_SEPOLIA"
    ;;
  "rpc-endpoint-mainnet")
    echo "$RPC_ENDPOINT_MAINNET"
    ;;
  *)
    echo "Invalid get option: $get_option"
    exit 1
    ;;
esac
