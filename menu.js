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
  loop();
}

main();