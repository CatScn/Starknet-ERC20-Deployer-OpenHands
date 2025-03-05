#!/usr/bin/env bash

# Determine the script's directory
SCRIPT_DIR="$(dirname "${BASH_SOURCE[0]}")"

# Construct the absolute path to the .env files
ENV_FILE="$SCRIPT_DIR/../.env"

# Load environment variables
load_env() {
  source "$ENV_FILE"
}

# Load environment variables
load_env

# Parse flags
show_help=false
while getopts "p:" opt; do
  case $opt in
    g)
      option_and_value="$OPTARG"
      option="${option_and_value%=*}"
      value="${option_and_value#*=}"
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      echo "Usage: ./config_set_project.sh -g <option>=value"
      exit 1
      ;;
    :)
      echo "Option -$OPTARG requires an argument." >&2
      exit 1
      ;;
  esac
done

# Set config options
case "$option" in
  "token-name")
    sed -i "s/^TOKEN_NAME=.*/TOKEN_NAME=$value/" "$ENV_FILE"
    ;;
  "symbol-name")
    sed -i "s/^SYMBOL_NAME=.*/SYMBOL_NAME=$value/" "$ENV_FILE"
    ;;
  "decimals-length")
    sed -i "s/^DECIMALS_LENGTH=.*/DECIMALS_LENGTH=$value/" "$ENV_FILE"
    ;;
  "fixed-supply")
    sed -i "s/^FIXED_SUPPLY=.*/FIXED_SUPPLY=$value/" "$ENV_FILE"
    ;;
  *)
    echo "Invalid option: $option"
    show_help=true
    ;;
esac

load_env # Reload environment variables after modification

if [ "$show_help" = true ]; then
  echo ""
  echo "Usage: ./config_set_project.sh -p <option>=value"
  echo "Config Options: token-name, symbol-name, decimals-length, fixed-supply"
  echo ""
  exit 1
fi