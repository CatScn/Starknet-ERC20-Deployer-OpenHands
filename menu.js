const readline = require('readline');
const { execSync } = require('child_process');

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout,
  terminal: false
});

const options = [
  "Set configuration value",
  "Get configuration value",
  "Initialize a new project",
  "Edit .env values",
  "Exit"
];

function askQuestion(query) {
  return new Promise(resolve => {
    rl.question(query, answer => {
      resolve(answer);
    });
  });
}

function main() {
  function loop() {
    console.log("\\nPlease enter your choice:");
    options.forEach((option, index) => {
      console.log(`${index + 1}. ${option}`);
    });

    askQuestion("Enter your choice: ")
      .then(choice => {
        const choiceNum = parseInt(choice);

        switch (choiceNum) {
          case 1:
            return askQuestion("Enter key: ")
              .then(key => askQuestion("Enter value: ")
                .then(value => {
                  execSync(`node CLI/cli.ts config set "${key}" "${value}"`);
                  loop();
                }));
          case 2:
            return askQuestion("Enter key: ")
              .then(key => {
                execSync(`node CLI/cli.ts config get "${key}"`);
                loop();
              });
          case 3:
            execSync(`node CLI/cli.ts config init`);
            loop();
            break;
          case 4:
            rl.close();
            return;
          default:
            console.log("Invalid option");
            loop();
        }
      })
      .catch(err => {
        console.error(err);
        rl.close();
      });
  }

  function editEnvValues() {
    askQuestion("Enter the variable name to edit: ")
      .then(variableName => {
        askQuestion(`Enter the new value for ${variableName}: `)
          .then(newValue => {
            const envFile = '/workspace/Starknet-ERC20-Deployer-OpenHands/.env';
            const fs = require('fs');

            fs.readFile(envFile, 'utf8', (err, data) => {
              if (err) {
                console.error("Error reading .env file:", err);
                loop();
                return;
              }

              const lines = data.split('\\n');
              let found = false;
              for (let i = 0; i < lines.length; i++) {
                if (lines[i].startsWith(variableName + '=')) {
                  lines[i] = `${variableName}=${newValue}`;
                  found = true;
                  break;
                }
              }

              if (!found) {
                console.log(`Variable ${variableName} not found in .env file.`);
                loop();
                return;
              }

              const newContent = lines.join('\\n');

              fs.writeFile(envFile, newContent, 'utf8', (err) => {
                if (err) {
                  console.error("Error writing .env file:", err);
                } else {
                  console.log(".env file updated successfully.");
                }
                loop();
              });
            });
          });
      });
  }

  function loop() {
    console.log("\\nPlease enter your choice:");
    options.forEach((option, index) => {
      console.log(`${index + 1}. ${option}`);
    });

    askQuestion("Enter your choice: ")
      .then(choice => {
        const choiceNum = parseInt(choice);

        switch (choiceNum) {
          case 1:
            return askQuestion("Enter key: ")
              .then(key => askQuestion("Enter value: ")
                .then(value => {
                  execSync(`node CLI/cli.ts config set "${key}" "${value}"`);
                  loop();
                }));
          case 2:
            return askQuestion("Enter key: ")
              .then(key => {
                execSync(`node CLI/cli.ts config get "${key}"`);
                loop();
              });
          case 3:
            execSync(`node CLI/cli.ts config init`);
            loop();
            break;
          case 4:
            editEnvValues();
            break;
          case 5:
            rl.close();
            return;
          default:
            console.log("Invalid option");
            loop();
        }
      })
      .catch(err => {
        console.error(err);
        rl.close();
      });
  }
  loop();
}

main();