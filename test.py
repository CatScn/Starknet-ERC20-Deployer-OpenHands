import os
from dotenv import load_dotenv, set_key, unset_key

def load_env_vars():
    dotenv_path = os.path.join(os.getcwd(), '.env')
    load_dotenv(dotenv_path)
    env_vars = {}
    with open(dotenv_path, 'r') as f:
        for line in f:
            line = line.strip()
            if line and not line.startswith('#') and '=' in line:
                key, value = line.split('=', 1)
                env_vars[key.strip()] = value.strip()
    return env_vars

def display_menu(env_vars):
    print("\nChoose an action:")
    print("1. List environment variables")
    print("2. Set an environment variable")
    print("3. Delete an environment variable")
    print("4. Exit")

def get_user_input(prompt):
    return input(prompt).strip()

def main():
    while True:
        env_vars = load_env_vars()
        display_menu(env_vars)

        choice = get_user_input("Enter your choice: ")

        if choice == '1':
            if env_vars:
                print("Environment variables:")
                for key, value in env_vars.items():
                    print(f"{key}={value}")
            else:
                print("No environment variables found in .env file.")

        elif choice == '2':
            key = get_user_input("Enter the variable name to set: ")
            value = get_user_input(f"Enter the value for {key}: ")
            dotenv_path = os.path.join(os.getcwd(), '.env')
            set_key(dotenv_path, key, value)
            print(f"Successfully set {key} to {value}")

        elif choice == '3':
            key = get_user_input("Enter the variable name to delete: ")
            dotenv_path = os.path.join(os.getcwd(), '.env')
            unset_key(dotenv_path, key)
            print(f"Successfully deleted {key}")

        elif choice == '4':
            print("Exiting...")
            break

        else:
            print("Invalid choice. Please try again.")

if __name__ == "__main__":
    main()