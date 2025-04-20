#!/usr/bin/env python3

import rospy
import cv2
from cv_bridge import CvBridge
from sensor_msgs.msg import Image

def main():
    rospy.init_node('edge_detect_publisher', anonymous=True)
    pub = rospy.Publisher('/camera/edges', Image, queue_size=10)
    bridge = CvBridge()

    cap = cv2.VideoCapture(0)
    if not cap.isOpened():
        rospy.logerr("Cannot open webcam")
        return

    rate = rospy.Rate(10)  # 10 Hz
    while not rospy.is_shutdown():
        ret, frame = cap.read()
        if not ret:
            rospy.logwarn("Failed to grab frame")
            continue

        # Convert to grayscale
        gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)
        # Apply Canny edge detection
        edges = cv2.Canny(gray, 50, 150)

        # Convert to ROS Image message
        edge_msg = bridge.cv2_to_imgmsg(edges, encoding='mono8')
        pub.publish(edge_msg)

        rate.sleep()

    cap.release()

if __name__ == '__main__':
    main()

