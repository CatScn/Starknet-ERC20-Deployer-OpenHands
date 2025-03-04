#!/usr/bin/env bash

# Check if .env exists in the root directory
if [ ! -f ../.env ]; then
  echo ".env file not found. Running config_init.sh..."
  ./config_init.sh
fi

# Execute config_get.sh commands
./config_get.sh -g private-key
./config_get.sh -g account-address
./config_get.sh -g network
./config_get.sh -g rpc-endpoint-sepolia
./config_get.sh -g rpc-endpoint-mainnet