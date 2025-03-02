#!/bin/bash

# Test setting NETWORK using expect
expect -c '
  spawn ./config_set.sh -g network
  expect "Enter new value for network: "
  send "testnet\r"
  expect eof
  wait
'

# Get the exit code
EXIT_CODE=$?

# Check the exit code
if [ "$EXIT_CODE" -eq 0 ]; then
  echo "Test passed!"
else
  echo "Test failed!"
  echo "Exit code: $EXIT_CODE"
fi