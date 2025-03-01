#!/usr/bin/env bash

# Script to manage project configuration

# Load environment variables
load_env() {
  source .env
}

# Load environment variables
load_env

# Function to get configuration values
config_get() {
  case "$1" in
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
      echo "Invalid configuration option: $1"
      ;;
  esac
}

# Main menu
while true; do
  echo "Options:"
  echo "1. config get private-key"
  echo "2. config get account-address"
  echo "3. config get network"
  echo "4. config get rpc-endpoint-sepolia"
  echo "5. config get rpc-endpoint-mainnet"
  echo "6. Exit"

  read -p "Enter your choice: " choice

  case "$choice" in
    1)
      config_get "private-key"
      ;;
    2)
      config_get "account-address"
      ;;
    3)
      config_get "network"
      ;;
    4)
      config_get "rpc-endpoint-sepolia"
      ;;
    5)
      config_get "rpc-endpoint-mainnet"
      ;;
    6)
      echo "Exiting..."
      break
      ;;
    *)
      echo "Invalid choice. Please try again."
      ;;
  esac
done