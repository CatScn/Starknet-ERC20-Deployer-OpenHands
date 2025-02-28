#!/bin/bash

# Function to display help message
help() {
  echo "Usage: cli.sh config [set|get|init]"
  echo "  config set <key> <value>  Set configuration value"
  echo "  config get <key>          Get configuration value"
  echo "  config init               Initialize a new project"
}

# Check if a command is provided
if [ $# -eq 0 ]; then
  help
  exit 1
fi

# Handle config command
if [ "$1" == "config" ]; then
  if [ "$2" == "set" ]; then
    if [ $# -eq 4 ]; then
      key="$3"
      value="$4"
      echo "Setting $key to $value"
      # Implement setting the configuration value here
    else
      echo "Error: Missing key or value for set command"
      help
      exit 1
    fi
  elif [ "$2" == "get" ]; then
    if [ $# -eq 3 ]; then
      key="$3"
      echo "Getting $key"
      # Implement getting the configuration value here
    else
      echo "Error: Missing key for get command"
      help
      exit 1
    fi
  elif [ "$2" == "init" ]; then
    echo "Initializing a new project"
    # Implement initializing a new project here
  else
    echo "Error: Invalid config subcommand"
    help
    exit 1
  fi
else
  echo "Error: Invalid command"
  help
  exit 1
fi