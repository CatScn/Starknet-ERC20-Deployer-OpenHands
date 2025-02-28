#!/bin/bash

# Function to load environment variables from .env file and store keys in an array
load_env_vars() {
  env_keys=()
  while IFS== read -r key value; do
    if [[ -n "$key" && ! "$key" =~ ^#.* ]]; then
      eval export "$key=$value"
      env_keys+=("$key")
    fi
  done < .env
}

# Function to display the main menu
display_menu() {
  echo ""
  echo "Choose an action:"
  echo "1. List environment variables"
  echo "2. Set an environment variable"
  echo "3. Delete an environment variable"
  echo "4. Exit"
}

# Function to display the environment variable menu
display_env_var_menu() {
  local i=1
  for key in "${env_keys[@]}"; do
    echo "$i. $key"
    ((i++))
  done
}

# Function to get user input
get_user_input() {
  read -r -p "$1" input
  echo "$input"
}

# Main function
main() {
  while true; do
    load_env_vars

    display_menu
    choice=$(get_user_input "Enter your choice: ")

    case "$choice" in
      1)
        echo "Environment variables:"
        env | grep -f <(sed 's/=.*//' .env)
        ;;
      2)
        display_env_var_menu
        var_choice=$(get_user_input "Enter the number of the variable to set: ")
        
        # Extract the variable name
        var_name=$(sed -n "${var_choice}p" .env | cut -d'=' -f1)

        if [[ -z "$var_name" ]]; then
          echo "Invalid variable number."
        else
          new_value=$(get_user_input "Enter the new value for $var_name: ")
          sed -i "s/^${var_name}=.*/${var_name}=${new_value}/" .env
          echo "Successfully set $var_name to $new_value"
        fi
        ;;
      3)
        var_name=$(get_user_input "Enter the variable name to delete: ")
        sed -i "/^${var_name}=.*/d" .env
        echo "Successfully deleted $var_name"
        ;;
      4)
        echo "Exiting..."
        break
        ;;
      *)
        echo "Invalid choice. Please try again."
        ;;
    esac
  done
}

main