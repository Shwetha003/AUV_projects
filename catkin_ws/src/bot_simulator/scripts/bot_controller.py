#!/usr/bin/env python3
import rospy
from std_msgs.msg import String
from bot_simulator.msg import botpose

# Bot's initial state
x, y = 0, 0
directions = ['N', 'E', 'S', 'W']
dir_index = 0  # starts facing North

pose_pub = None

def command_callback(msg):
    global x, y, dir_index, pose_pub

    command = msg.data.lower()

    if command == "forward":
        if directions[dir_index] == 'N':
            y += 1
        elif directions[dir_index] == 'E':
            x += 1
        elif directions[dir_index] == 'S':
            y -= 1
        elif directions[dir_index] == 'W':
            x -= 1
    elif command == "backward":
        if directions[dir_index] == 'N':
            y -= 1
        elif directions[dir_index] == 'E':
            x -= 1
        elif directions[dir_index] == 'S':
            y += 1
        elif directions[dir_index] == 'W':
            x += 1
    elif command == "left":
        dir_index = (dir_index - 1) % 4
    elif command == "right":
        dir_index = (dir_index + 1) % 4

    pose_msg = botpose()
    pose_msg.x = x
    pose_msg.y = y
    pose_msg.direction = directions[dir_index]
    pose_pub.publish(pose_msg)

    rospy.loginfo(f"Bot Position -> x: {x}, y: {y}, direction: {directions[dir_index]}")

def main():
    global pose_pub
    rospy.init_node('bot_controller', anonymous=True)

    pose_pub = rospy.Publisher('bot_pose', botpose, queue_size=10)
    rospy.Subscriber('bot_command', String, command_callback)

    rospy.spin()

if __name__ == '__main__':
    main()

