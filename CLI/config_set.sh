#!/usr/bin/env bash

# Load environment variables
load_env() {
  source "$(pwd)/.env"
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
if [ -n "$config_action" ] && [ -n "$set_option" ]; then
  case "$config_action" in
    "get")
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
      ;;
    "init")
      echo "Init not implemented yet"
      exit 1
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
      echo "Invalid config action: $config_action"
      exit 1
      ;;
  esac
else
  echo "Usage: ./cli.sh -c <config_option> -g <set_option>"
  echo "Usage: ./config_set.sh -c get -g <option>"
  echo ""
  echo "Config Options: private-key, account-address, network, rpc-endpoint-sepolia, rpc-endpoint-mainnet"
  exit 1
fi
