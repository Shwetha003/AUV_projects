#!/usr/bin/env python3
import rospy
import cv2
from cv_bridge import CvBridge
from sensor_msgs.msg import Image

def main():
    rospy.init_node('webcam_node', anonymous=True)
    pub = rospy.Publisher('/camera/image_raw', Image, queue_size=10)
    bridge = CvBridge()

    cap = cv2.VideoCapture(0)  # Open default webcam
    if not cap.isOpened():
        rospy.logerr("Cannot open webcam")
        return

    rate = rospy.Rate(30)  # 30 Hz publishing rate
    rospy.loginfo("Publishing webcam images on /camera/image_raw")

    while not rospy.is_shutdown():
        ret, frame = cap.read()
        if not ret:
            rospy.logwarn("Frame grab failed, retrying...")
            continue
        # Convert OpenCV image (NumPy array) to ROS Image message
        msg = bridge.cv2_to_imgmsg(frame, encoding='bgr8')
        pub.publish(msg)
        rate.sleep()

    cap.release()

if __name__ == '__main__':
    try:
        main()
    except rospy.ROSInterruptException:
        pass

