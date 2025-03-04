#!/usr/bin/env bash

# Load environment variables
load_env() {
  source "$(pwd)/.env"
}

# Load environment variables
load_env

# Parse flags
while getopts "n:s:d:f:" opt; do
  case $opt in
    n)
      TOKEN_NAME="$OPTARG"
      ;;
    s)
      SYMBOL_NAME="$OPTARG"
      ;;
    d)
      DECIMALS_LENGTH="$OPTARG"
      ;;
    f)
      FIXED_SUPPLY="$OPTARG"
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      echo "Usage: ./config_set_project.sh -n <token_name> -s <symbol_name> -d <decimals_length> -f <fixed_supply>"
      exit 1
      ;;
    :)
      echo "Option -$OPTARG requires an argument." >&2
      exit 1
      ;;
  esac
done

# Set config options
if [ -n "$TOKEN_NAME" ]; then
  sed -i "s/^TOKEN_NAME=.*/TOKEN_NAME=$TOKEN_NAME/" .env
fi

if [ -n "$SYMBOL_NAME" ]; then
  sed -i "s/^SYMBOL_NAME=.*/SYMBOL_NAME=$SYMBOL_NAME/" .env
fi

if [ -n "$DECIMALS_LENGTH" ]; then
  sed -i "s/^DECIMALS_LENGTH=.*/DECIMALS_LENGTH=$DECIMALS_LENGTH/" .env
fi

if [ -n "$FIXED_SUPPLY" ]; then
  sed -i "s/^FIXED_SUPPLY=.*/FIXED_SUPPLY=$FIXED_SUPPLY/" .env
fi

load_env # Reload environment variables after modification