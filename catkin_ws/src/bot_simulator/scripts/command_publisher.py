#!/usr/bin/env python3
import rospy
from std_msgs.msg import String

def publisher():
    pub = rospy.Publisher('bot_command', String, queue_size=10)
    rospy.init_node('command_publisher', anonymous=True)
    rate = rospy.Rate(1)

    print("Enter bot commands: forward, left, right, backward (or 'exit' to quit)")
    
    while not rospy.is_shutdown():
        cmd = input("Command: ").lower()
        if cmd == "exit":
            break
        pub.publish(cmd)
        rate.sleep()

if __name__ == '__main__':
    try:
        publisher()
    except rospy.ROSInterruptException:
        pass

