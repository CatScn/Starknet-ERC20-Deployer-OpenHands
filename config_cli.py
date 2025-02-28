import os
import argparse
from dotenv import load_dotenv, set_key

def config_set(args):
    dotenv_path = os.path.join(os.getcwd(), '.env')
    load_dotenv(dotenv_path)

    if args.key == 'private-key':
        set_key(dotenv_path, 'DEPLOYER_PRIVATE_KEY', args.value)
    elif args.key == 'account-address':
        set_key(dotenv_path, 'DEPLOYER_ADDRESS', args.value)
    elif args.key == 'network':
        set_key(dotenv_path, 'NETWORK', args.value)
    else:
        print(f"Error: Invalid configuration key: {args.key}")
        return

    print(f"Successfully set {args.key} to {args.value}")

def config_get(args):
    dotenv_path = os.path.join(os.getcwd(), '.env')
    load_dotenv(dotenv_path)

    if args.key == 'private-key':
        value = os.getenv('DEPLOYER_PRIVATE_KEY')
    elif args.key == 'account-address':
        value = os.getenv('DEPLOYER_ADDRESS')
    elif args.key == 'network':
        value = os.getenv('NETWORK')
    else:
        print(f"Error: Invalid configuration key: {args.key}")
        return

    print(f"{args.key}: {value}")

def config_init(args):
    dotenv_path = os.path.join(os.getcwd(), '.env')
    if os.path.exists(dotenv_path):
        print(".env file already exists.")
        return

    with open(dotenv_path, 'w') as f:
        f.write("DEPLOYER_PRIVATE_KEY=\n")
        f.write("DEPLOYER_ADDRESS=\n")
        f.write("NETWORK=sepolia\n")
        f.write("RPC_ENDPOINT_SEPOLIA=https://starknet-sepolia.public.blastapi.io\n")
        f.write("RPC_ENDPOINT_MAINNET=https://starknet-mainnet.public.blastapi.io\n")
        f.write("TOKEN_NAME=Test\n")
        f.write("SYMBOL_NAME=tst\n")
        f.write("DECIMALS_LENGTH=18\n")
        f.write("FIXED_SUPPLY=100000000000000000000000000\n")

    print(".env file created successfully.")

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Manage project configuration.")
    subparsers = parser.add_subparsers(dest="command", help="Sub-command help")

    # config set
    set_parser = subparsers.add_parser("set", help="Set configuration values")
    set_parser.add_argument("key", help="Configuration key to set")
    set_parser.add_argument("value", help="Value to set for the key")
    set_parser.set_defaults(func=config_set)

    # config get
    get_parser = subparsers.add_parser("get", help="Get configuration values")
    get_parser.add_argument("key", help="Configuration key to get")
    get_parser.set_defaults(func=config_get)

    # config init
    init_parser = subparsers.add_parser("init", help="Initialize a new project")
    init_parser.set_defaults(func=config_init)

    args = parser.parse_args()

    if args.command:
        args.func(args)
    else:
        parser.print_help()