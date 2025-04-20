#!/usr/bin/env python3
import rospy
import cv2
from cv_bridge import CvBridge
from sensor_msgs.msg import Image

def callback(msg):
    # Convert ROS Image to OpenCV image :contentReference[oaicite:11]{index=11}
    bridge = CvBridge()
    try:
        cv_img = bridge.imgmsg_to_cv2(msg, desired_encoding='mono8')
    except Exception as e:
        rospy.logerr(f"CV Bridge error: {e}")
        return

    # Display the edge image :contentReference[oaicite:12]{index=12}
    cv2.imshow("Edge Detection", cv_img)
    cv2.waitKey(1)

def main():
    rospy.init_node('edge_subscriber')
    rospy.Subscriber('/camera/edges', Image, callback, queue_size=1)  # :contentReference[oaicite:13]{index=13}
    rospy.loginfo("Subscribed to /camera/edges")
    rospy.spin()
    cv2.destroyAllWindows()

if __name__ == '__main__':
    main()

