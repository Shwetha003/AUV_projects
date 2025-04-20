#!/usr/bin/env python3
import rospy
from auv_chat.msg import ChatMsg

def callback(data):
    rospy.loginfo("[%s]: %s" % (data.sender, data.message))

def chat_node():
    rospy.init_node('chat_node', anonymous=True)

    name = input("Enter your name (e.g., Jolyne or Joestar): ")

    pub = rospy.Publisher('chat_topic', ChatMsg, queue_size=10)
    rospy.Subscriber('chat_topic', ChatMsg, callback)

    rate = rospy.Rate(10)

    while not rospy.is_shutdown():
        msg = input(f"{name}: ")
        chat = ChatMsg()
        chat.sender = name
        chat.message = msg
        pub.publish(chat)
        rate.sleep()

if __name__ == '__main__':
    try:
        chat_node()
    except rospy.ROSInterruptException:
        pass

