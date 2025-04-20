#!/usr/bin/env python3

import rospy
import cv2
from cv_bridge import CvBridge
from sensor_msgs.msg import Image

def callback(msg):
    bridge = CvBridge()
    try:
        # Convert ROS Image message to OpenCV image
        cv_image = bridge.imgmsg_to_cv2(msg, desired_encoding='mono8')
        cv2.imshow('Edge Detection', cv_image)
        cv2.waitKey(1)
    except Exception as e:
        rospy.logerr(f"Error converting image: {e}")

def main():
    rospy.init_node('edge_detect_subscriber', anonymous=True)
    rospy.Subscriber('/camera/edges', Image, callback)
    rospy.spin()
    cv2.destroyAllWindows()

if __name__ == '__main__':
    main()

