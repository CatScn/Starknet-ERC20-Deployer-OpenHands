#!/bin/bash

PS3="Please enter your choice: "
options=(
  "Set configuration value"
  "Get configuration value"
  "Initialize a new project"
  "Exit"
)
select opt in "${options[@]}"
do
  case $opt in
    "Set configuration value")
      read -p "Enter key: " key
      read -p "Enter value: " value
      node CLI/cli.ts config set "$key" "$value"
      ;;
    "Get configuration value")
      read -p "Enter key: " key
      node CLI/cli.ts config get "$key"
      ;;
    "Initialize a new project")
      node CLI/cli.ts config init
      ;;
    "Exit")
      break
      ;;
    *) echo "Invalid option $REPLY";;
  esac
done