from http.client import OK
import rclpy
import time
import sys
import tty
import termios
from rclpy.node import Node
# from rclpy import create_subscription
from motion_msgs.msg import MotionCtrl
from std_msgs.msg import String

CMD_GO_FORWARD = 0x08
CMD_GO_LEFT = 0x04
CMD_ROLL_RIGHT = 0x09

CMD_HEIGH_MODE = 0x01
CMD_BODY_UP = 0x11

CMD_STAND_UP = 0x02
CMD_STAND_DOWN = 0x12

CMD_PITCH = 0x03
CMD_PITCH_MODE = 0x13

CMD_SPEED_MODE = 0x05

def run_command(command):
    rclpy.init()
    node = Node("diablo_teleop_node")
    msg = MotionCtrl()
    teleop_cmd = node.create_publisher(MotionCtrl,"diablo/MotionCmd",2)
    if command == 'go_forward':
        msg.cmd_id = CMD_GO_FORWARD
        msg.value = 1.0
    elif command == 'go_backward':
        msg.cmd_id = CMD_GO_FORWARD
        msg.value = -(1.0)
    elif command == 'go_left':
        msg.cmd_id = CMD_GO_LEFT
        msg.value = 1.0
    elif command == 'go_right':
        msg.cmd_id = CMD_GO_LEFT
        msg.value = -(1.0)
    elif command == 'body_up':
        msg.cmd_id = CMD_BODY_UP
        msg.value = 1.0
    elif command == 'pitch':
        msg.cmd_id = CMD_PITCH
        msg.value = 1.0
    else:
        msg.cmd_id = 0x00
        msg.value = 0.0

    teleop_cmd. publish(msg)
    rclpy. spin_once(node)
