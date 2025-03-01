#!/usr/bin/env bash

# Determine the script's directory
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# Construct the absolute path to the .env file
ENV_FILE="$SCRIPT_DIR/../.env"
TEST_ENV_FILE="$SCRIPT_DIR/../test.env"

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
  TARGET_ENV_FILE="$TEST_ENV_FILE"
else
  CONFIG_FILE=".env"
  TARGET_ENV_FILE="$ENV_FILE"
fi

# Check if CONFIG_FILE already exists
if [ -f "$TARGET_ENV_FILE" ]; then
  echo "$TARGET_ENV_FILE already exists. Please delete it if you want to re-initialize."
  exit 1
fi

# Copy example.env to CONFIG_FILE
cp "/workspace/Starknet-ERC20-Deployer-OpenHands/example.env" "$TARGET_ENV_FILE"

echo "$TARGET_ENV_FILE file created successfully."