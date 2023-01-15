from flask import Flask, render_template, request
from teleop_script import teleop
from teleop_script import battery_status

app = Flask(__name__)

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/teleop', methods=['POST'])
def teleop():
    command = request.form['command']
#    value = request.form['value']
    teleop.run_command(command)
    return 'Command sent'

@app.route('/battery_status', methods=['GET'])
def battery_status():
    return battery_status.get_battery_status()

if __name__ == '__main__':
    app.run()

