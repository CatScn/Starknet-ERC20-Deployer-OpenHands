#!/usr/bin/env node

function help() {
  console.log("Usage: cli.ts config [set|get|init]");
  console.log("  config set <key> <value>  Set configuration value");
  console.log("  config get <key>          Get configuration value");
  console.log("  config init               Initialize a new project");
}

const args = process.argv.slice(2);

if (args.length === 0) {
  help();
  process.exit(1);
}

if (args[0] === "config") {
  if (args[1] === "set") {
    if (args.length === 4) {
      const key = args[2];
      const value = args[3];
      console.log(`Setting ${key} to ${value}`);
      // Implement setting the configuration value here
    } else {
      console.error("Error: Missing key or value for set command");
      help();
      process.exit(1);
    }
  } else if (args[1] === "get") {
    if (args.length === 3) {
      const key = args[2];
      console.log(`Getting ${key}`);
      // Implement getting the configuration value here
    } else {
      console.error("Error: Missing key for get command");
      help();
      process.exit(1);
    }
  } else if (args[1] === "init") {
    console.log("Initializing a new project");
    // Implement initializing a new project here
  } else {
    console.error("Error: Invalid config subcommand");
    help();
    process.exit(1);
  }
} else {
  console.error("Error: Invalid command");
  help();
  process.exit(1);
}