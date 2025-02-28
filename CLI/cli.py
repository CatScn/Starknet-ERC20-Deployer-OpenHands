import argparse

def main():
    parser = argparse.ArgumentParser(description="Starknet ERC20 Deployer CLI")
    subparsers = parser.add_subparsers(dest="command", help="Available commands")

    # Config command
    config_parser = subparsers.add_parser("config", help="Manage project configuration")
    config_subparsers = config_parser.add_subparsers(dest="config_command", help="Config subcommands")

    # Config set command
    config_set_parser = config_subparsers.add_parser("set", help="Set configuration values")
    config_set_parser.add_argument("key", help="Configuration key (e.g., private-key, account-address, network)")
    config_set_parser.add_argument("value", help="Configuration value")

    # Config get command
    config_get_parser = config_subparsers.add_parser("get", help="Get configuration values")
    config_get_parser.add_argument("key", help="Configuration key (e.g., private-key, account-address, network)")

    # Config init command
    config_init_parser = config_subparsers.add_parser("init", help="Initialize a new project")

    args = parser.parse_args()

    if args.command == "config":
        if args.config_command == "set":
            print(f"Setting {args.key} to {args.value}")
            # Implement setting the configuration value here
        elif args.config_command == "get":
            print(f"Getting {args.key}")
            # Implement getting the configuration value here
        elif args.config_command == "init":
            print("Initializing a new project")
            # Implement initializing a new project here
        else:
            config_parser.print_help()
    else:
        parser.print_help()

if __name__ == "__main__":
    main()