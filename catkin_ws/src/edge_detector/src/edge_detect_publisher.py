#!/usr/bin/env python3
import rospy
import cv2
from cv_bridge import CvBridge
from sensor_msgs.msg import Image

def main():
    rospy.init_node('edge_detect_publisher')
    pub = rospy.Publisher('/camera/edges', Image, queue_size=10)
    bridge = CvBridge()

    # Open default webcam
    cap = cv2.VideoCapture(0)                          # :contentReference[oaicite:4]{index=4}
    cap.set(cv2.CAP_PROP_FRAME_WIDTH, 640)
    cap.set(cv2.CAP_PROP_FRAME_HEIGHT, 480)

    rate = rospy.Rate(30)  # 30 Hz
    rospy.loginfo("Publishing edge images on /camera/edges")

    while not rospy.is_shutdown():
        ret, frame = cap.read()
        if not ret:
            rospy.logwarn("Failed to grab frame")
            continue

        # 1) Convert to grayscale
        gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)

        # 2) Reduce noise with a 5×5 Gaussian filter :contentReference[oaicite:5]{index=5}
        blur = cv2.GaussianBlur(gray, (5, 5), 0)

        # 3) Canny edge detection :contentReference[oaicite:6]{index=6}
        edges = cv2.Canny(blur, 50, 150)

        # 4) Convert to ROS Image message and publish :contentReference[oaicite:7]{index=7}
        img_msg = bridge.cv2_to_imgmsg(edges, encoding='mono8')
        pub.publish(img_msg)

        rate.sleep()

    cap.release()

if __name__ == '__main__':
    try:
        main()
    except rospy.ROSInterruptException:
        pass

