#!/usr/bin/env bash

TEST_FLAG=false

while [[ $# -gt 0 ]]; do
  case "$1" in
    --test)
      TEST_FLAG=true
      shift
      ;;
    *)
      echo "Unknown parameter passed: $1"
      exit 1
      ;;
  esac
done

if [ "$TEST_FLAG" = true ]; then
  CONFIG_FILE="test.env"
else
  CONFIG_FILE=".env"
fi

# Check if CONFIG_FILE already exists
if [ -f "$CONFIG_FILE" ]; then
  echo "$CONFIG_FILE already exists. Please delete it if you want to re-initialize."
  exit 1
fi

# Copy example.env to CONFIG_FILE
cp /workspace/Starknet-ERC20-Deployer-OpenHands/example.env "/workspace/Starknet-ERC20-Deployer-OpenHands/$CONFIG_FILE"

echo "$CONFIG_FILE file created successfully."