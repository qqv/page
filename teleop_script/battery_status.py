from http.client import OK
import rclpy
import time
import sys
import tty
import termios
from rclpy.node import Node
from rclpy import create_subscription
from motion_msgs.msg import MotionCtrl
from std_msgs.msg import String

def battery_status ():
    rclpy.init()
    node = Node("diablo_teleop_node")
    msg = MotionCtrl()
    teleop_cmd = node.create_publisher(MotionCtrl,"diablo/MotionCmd",2)
    msg.cmd_id = 0x00
    msg.value = 0.0
    teleop_cmd.publish(msg)
    return 'Command sent'

if __name__ == '__main__':
    battery_status()

# class Teleop(Node):
#     def __init__(self):
#         super().__init__('diablo_teleop_node')
#         self.command = None
#         self.subscriber = create_subscription(String, 'battery_status', self.listener_callback, 10)

# def listener_callback(self, msg):
#         self.command = msg.data