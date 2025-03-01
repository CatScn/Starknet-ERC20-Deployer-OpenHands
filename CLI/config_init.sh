#!/usr/bin/env bash

# Check if .env already exists
if [ -f .env ]; then
  echo ".env already exists. Please delete it if you want to re-initialize."
  exit 1
fi

# Copy example.env to .env
cp /workspace/Starknet-ERC20-Deployer-OpenHands/example.env /workspace/Starknet-ERC20-Deployer-OpenHands/.env

echo ".env file created successfully."