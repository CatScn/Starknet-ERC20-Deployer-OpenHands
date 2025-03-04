
#!/usr/bin/env bash
SCRIPT_DIR="$(dirname "${BASH_SOURCE[0]}")"
ENV_FILE="$SCRIPT_DIR/../.env"

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
      option_and_value="$OPTARG"
      option="${option_and_value%=*}"
      value="${option_and_value#*=}"
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      show_help=true
      ;;
    :)
      echo "Option -$OPTARG requires an argument." >&2
      exit 1
      ;;
  esac
done

# Set config option
case "$option" in
  "private-key")
    sed -i "s/^DEPLOYER_PRIVATE_KEY=.*/DEPLOYER_PRIVATE_KEY=$value/" "$ENV_FILE"
    ;;
  "account-address")
    sed -i "s/^DEPLOYER_ADDRESS=.*/DEPLOYER_ADDRESS=$value/" "$ENV_FILE"
    ;;
  "network")
    sed -i "s/^NETWORK=.*/NETWORK=$value/" "$ENV_FILE"
    ;;
  "rpc-endpoint-sepolia")
    sed -i "s/^RPC_ENDPOINT_SEPOLIA=.*/RPC_ENDPOINT_SEPOLIA=$value/" "$ENV_FILE"
    ;;
  "rpc-endpoint-mainnet")
    sed -i "s/^RPC_ENDPOINT_MAINNET=.*/RPC_ENDPOINT_MAINNET=$value/" "$ENV_FILE"
    ;;
  *)
    echo "Invalid option: $option"
    show_help=true
    ;;
esac

if [ "$show_help" = true ]; then
  echo ""
  echo "Usage: ./config_set.sh -g <option>=value"
  echo "Config Options: private-key, account-address, network, rpc-endpoint-sepolia, rpc-endpoint-mainnet"
  echo ""
  exit 1
fi

load_env # Reload environment variables after modification
