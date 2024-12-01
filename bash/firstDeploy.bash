#!/bin/bash

# Copy the example.env to .env
cp example.env .env

# Prompt the user to enter the DEPLOYER_PRIVATE_KEY
echo "Please enter your wallet's private key:"
read -r -s deployer_private_key
# Append the DEPLOYER_PRIVATE_KEY to the .env file
sed -i "s|DEPLOYER_PRIVATE_KEY=.*|DEPLOYER_PRIVATE_KEY=$deployer_private_key|" .env

# Prompt the user to enter the DEPLOYER_ADDRESS
echo "Please enter your wallet's address:"
read -r deployer_address
# Append the DEPLOYER_ADDRESS to the .env file
sed -i "s|DEPLOYER_ADDRESS=.*|DEPLOYER_ADDRESS=$deployer_address|" .env

echo ".env has been updated with your wallet address and private key."

npm run deploy
