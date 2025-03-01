#!/usr/bin/env bash

# Load environment variables
load_env() {
  source .env
}

# Load environment variables
load_env

# Parse flags
while getopts "c:g:" opt; do
  case $opt in
    c)
      config_action="$OPTARG"
      ;;
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

# Check if --config and --get are used together
if [ -n "$config_action" ] && [ -n "$get_option" ]; then
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
else
  echo "Usage: ./cli.sh -c <config_option> -g <get_option>"
  echo ""
  echo "Config Options: private-key, account-address, network, rpc-endpoint-sepolia, rpc-endpoint-mainnet"
  exit 1
fi