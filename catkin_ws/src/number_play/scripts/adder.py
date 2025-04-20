#!/usr/bin/env python3
import rospy
from std_msgs.msg import Int32

def callback(data):
    final_result = data.data + 5
    rospy.loginfo(f"Final Result: {final_result}")

def listener():
    rospy.init_node('adder_node', anonymous=True)
    rospy.Subscriber('topic_2', Int32, callback)
    rospy.spin()

if __name__ == '__main__':
    listener()

