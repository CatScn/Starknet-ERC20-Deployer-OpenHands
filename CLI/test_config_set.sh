#!/usr/bin/expect -f

# Set timeout
set timeout 10

# Source the config_get.sh script
source ./config_get.sh

# Test setting NETWORK
spawn ./config_set.sh -g network
expect "Enter new value for network: "
send "goerli\r"
expect eof
interact

# Test setting DEPLOYER_ADDRESS
spawn ./config_set.sh -g account-address
expect "Enter new value for account-address: "
send "0x12345\r"
expect eof
interact

# Get the values and check if they are correct
NETWORK_VALUE=$(config_get NETWORK)
DEPLOYER_ADDRESS_VALUE=$(config_get DEPLOYER_ADDRESS)

if { "$NETWORK_VALUE" == "goerli" && "$DEPLOYER_ADDRESS_VALUE" == "0x12345" } {
  puts "Test passed!"
} else {
  puts "Test failed!"
  puts "NETWORK_VALUE: $NETWORK_VALUE"
  puts "DEPLOYER_ADDRESS_VALUE: $DEPLOYER_ADDRESS_VALUE"
}