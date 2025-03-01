#!/usr/bin/env bash

# Load environment variables
load_env() {
  source .env
}

# Load environment variables
load_env

# Parse flags
while getopts "g:" opt; do
  case $opt in
    g)
      set_option="$OPTARG"
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
if [ -n "$set_option" ]; then
  read -p "Enter new value for $set_option: " new_value
  case "$set_option" in
    "private-key")
      sed -i "s/^DEPLOYER_PRIVATE_KEY=.*/DEPLOYER_PRIVATE_KEY=\"$new_value\"/" .env
      ;;
    "account-address")
      sed -i "s/^DEPLOYER_ADDRESS=.*/DEPLOYER_ADDRESS=\"$new_value\"/" .env
      ;;
    "network")
      sed -i "s/^NETWORK=.*/NETWORK=\"$new_value\"/" .env
      ;;
    "rpc-endpoint-sepolia")
      echo "Cannot set rpc-endpoint-sepolia"
      exit 1
      ;;
    "rpc-endpoint-mainnet")
      echo "Cannot set rpc-endpoint-mainnet"
      exit 1
      ;;
    *)
      echo "Invalid set option: $set_option"
      exit 1
      ;;
  esac
  echo "$set_option set to $new_value"
else
  echo "Usage: ./config_set.sh -g <option>"
  echo ""
  echo "Config Options: private-key, account-address, network, rpc-endpoint-sepolia, rpc-endpoint-mainnet"
  exit 1
fi