#!/usr/bin/env python3
import rospy
from std_msgs.msg import Int32

def callback(data):
    multiplied = data.data * 10
    rospy.loginfo(f"Received: {data.data}, Multiplied: {multiplied}")
    pub.publish(multiplied)

def listener():
    global pub
    rospy.init_node('multiplier_node', anonymous=True)
    pub = rospy.Publisher('topic_2', Int32, queue_size=10)
    rospy.Subscriber('topic_1', Int32, callback)
    rospy.spin()

if __name__ == '__main__':
    listener()

