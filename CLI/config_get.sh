#!/usr/bin/env bash

# Determine the script's directory
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# Construct the absolute path to the .env files
ENV_FILE="$SCRIPT_DIR/../.env"
TEST_ENV_FILE="$SCRIPT_DIR/../test.env"

# Check for the --test flag
TEST_FLAG=false
while [[ $# -gt 0 ]]; do
  case "$1" in
    --test)
      TEST_FLAG=true
      shift
      ;;
    *)
      break # Stop parsing flags
      ;;
  esac
done

# Determine which env file to use
if [ "$TEST_FLAG" = true ]; then
  ENV_TO_SOURCE="$TEST_ENV_FILE"
else
  ENV_TO_SOURCE="$ENV_FILE"
fi

# Load environment variables
load_env() {
  if [ -f "$ENV_TO_SOURCE" ]; then
    source "$ENV_TO_SOURCE"
  else
    echo "Error: Environment file '$ENV_TO_SOURCE' not found."
    if [ "$TEST_FLAG" = true ]; then
      echo "Initializing test environment..."
      "$SCRIPT_DIR/config_init.sh" --test
      source "$TEST_ENV_FILE" # Source the newly created test.env
    else
      exit 1
    fi
  fi
}

# Load environment variables
load_env

# Parse flags (after removing --test)
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
  echo "Usage: ./config_get.sh [-t|--test] -g <option>"
  echo ""
  echo "Config Options: private-key, account-address, network, rpc-endpoint-sepolia, rpc-endpoint-mainnet"
  exit 1
fi