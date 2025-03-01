#!/usr/bin/env bash

# Determine the script's directory
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# Construct the absolute path to the .env file
ENV_FILE="$SCRIPT_DIR/../.env"

# Check if .env exists, if not, run config_init.sh
if [ ! -f "$ENV_FILE" ]; then
  echo ".env file not found. Running config_init.sh..."
  "$SCRIPT_DIR/config_init.sh"
fi

# Load environment variables
load_env() {
  source "$ENV_FILE"
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

# Check if -g is used
if [ -n "$get_option" ]; then
  case "$get_option" in
    "private-key")
      printf "%s\n" "${DEPLOYER_PRIVATE_KEY}"
      exit 0
      ;;
    "account-address")
      printf "%s\n" "${DEPLOYER_ADDRESS}"
      exit 0
      ;;
    "network")
      printf "%s\n" "${NETWORK}"
      exit 0
      ;;
    "rpc-endpoint-sepolia")
      printf "%s\n" "${RPC_ENDPOINT_SEPOLIA}"
      exit 0
      ;;
    "rpc-endpoint-mainnet")
      printf "%s\n" "${RPC_ENDPOINT_MAINNET}"
      exit 0
      ;;
    *)
      echo "Invalid get option: $get_option"
      exit 1
      ;;
  esac
else
  echo "Usage: ./config_get.sh -g <option>"
  echo ""
  echo "Config Options: private-key, account-address, network, rpc-endpoint-sepolia, rpc-endpoint-mainnet"
  exit 1
fi