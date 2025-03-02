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

# Verify network is goerli
set NETWORK_VALUE [exec ./config_get.sh network]

if { "$NETWORK_VALUE" eq "goerli" } {
  puts "Test passed!"
} else {
  puts "Test failed!"
}