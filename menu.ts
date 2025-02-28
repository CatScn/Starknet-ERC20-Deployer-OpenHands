import * as readline from 'readline';
import { execSync } from 'child_process';

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout,
  terminal: false
});

const options = [
  "Set configuration value",
  "Get configuration value",
  "Initialize a new project",
  "Exit"
];

function askQuestion(query: string): Promise<string> {
  return new Promise(resolve => {
    rl.question(query, answer => {
      resolve(answer);
    });
  });
}

async function main() {
  while (true) {
    console.log("\\nPlease enter your choice:");
    options.forEach((option, index) => {
      console.log(`${index + 1}. ${option}`);
    });

    const choice = await askQuestion("Enter your choice: ");
    const choiceNum = parseInt(choice);

    switch (choiceNum) {
      case 1: {
        const key = await askQuestion("Enter key: ");
        const value = await askQuestion("Enter value: ");
        execSync(`node CLI/cli.ts config set "${key}" "${value}"`);
        break;
      }
      case 2: {
        const key = await askQuestion("Enter key: ");
        execSync(`node CLI/cli.ts config get "${key}"`);
        break;
      }
      case 3: {
        execSync(`node CLI/cli.ts config init`);
        break;
      }
      case 4: {
        rl.close();
        return;
      }
      default:
        console.log("Invalid option");
    }
  }
}

main();