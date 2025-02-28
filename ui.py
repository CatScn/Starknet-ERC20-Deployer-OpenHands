from flask import Flask, render_template, request
import subprocess
import os

app = Flask(__name__)

@app.route('/', methods=['GET', 'POST'])
def index():
    output = ""
    if request.method == 'POST':
        command = request.form['command']
        try:
            # Ensure cli.ts is executable
            os.chmod('/workspace/Starknet-ERC20-Deployer-OpenHands/CLI/cli.ts', 0o755)
            process = subprocess.Popen(['node', '/workspace/Starknet-ERC20-Deployer-OpenHands/CLI/cli.ts'] + command.split(),
                                       cwd='/workspace/Starknet-ERC20-Deployer-OpenHands',
                                       stdout=subprocess.PIPE,
                                       stderr=subprocess.PIPE)
            stdout, stderr = process.communicate()
            output = stdout.decode() + stderr.decode()
        except Exception as e:
            output = str(e)
    return render_template('index.html', output=output)

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=50410)