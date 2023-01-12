from flask import Flask, render_template, request
from teleop_script import teleop

app = Flask(__name__)

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/teleop', methods=['POST'])
def receive_teleop_command():
    command = request.json['command']
    teleop(command)
    return 'Command received'

if __name__ == '__main__':
    app.run(debug=True)


