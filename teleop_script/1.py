# this python file want to send msg to the topic "diablo/MotionCmd" and the msg is MotionCtrl type.
# when the user input the button from /templates/index.html , it's will post the msg to this program.
# the html file will through main.py to connect between this program with Flask.
from http.client import OK
import rclpy
import time
import sys
import tty
import termios
from rclpy.node import Node
from motion_msgs.msg import MotionCtrl

CMD_GO_FORWARD = 0x08
CMD_GO_LEFT = 0x04
CMD_ROLL_RIGHT = 0x09

CMD_HEIGH_MODE = 0x01
CMD_BODY_UP = 0x11

CMD_STAND_UP = 0x02
CMD_STAND_DOWN  =  0x12

CMD_PITCH = 0x03
CMD_PITCH_MODE = 0x13

CMD_SPEED_MODE = 0x05

def teleop(command):
    rclpy.init()
    node = rclpy.create_node('teleop')
    publisher = node.create_publisher(MotionCtrl, 'diablo/MotionCmd', 10)

    if command == 'w':
        msg.cmd_id = CMD_GO_FORWARD
        msg.value = 1.0
    elif command == 's':
        msg.cmd_id = CMD_GO_FORWARD
        msg.value = -(1.0)
    elif command == 'a':
        msg.cmd_id = CMD_GO_LEFT
        msg.value = 1.0
    elif command == 'd':
        msg.cmd_id = CMD_GO_LEFT
        msg.value = -(1.0)
    else :
        msg.cmd_id = CMD_GO_FORWARD
        msg.value = 0.0
    
    publisher.publish(msg)
    node.destroy_node()
    rclpy.shutdown()
    