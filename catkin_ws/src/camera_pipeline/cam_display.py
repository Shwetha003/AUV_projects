import depthai as dai
import cv2

# Step 1: Create a pipeline
pipeline = dai.Pipeline()

# Step 2: Create a ColorCamera node
cam_rgb = pipeline.create(dai.node.ColorCamera)
cam_rgb.setPreviewSize(640, 480)  # You can change this as per your device
cam_rgb.setInterleaved(False)
cam_rgb.setFps(30)

# Step 3: Create an XLinkOut node to stream camera output to the host
xout = pipeline.create(dai.node.XLinkOut)
xout.setStreamName("video")  # This will be the stream we read from in the host script

# Step 4: Link camera preview output to the XLinkOut input
cam_rgb.preview.link(xout.input)

# Step 5: Start the pipeline using Device context
with dai.Device(pipeline) as device:
    print("Pipeline started... Press 'q' to quit")

    # Step 6: Get the output queue from the device
    video_queue = device.getOutputQueue(name="video", maxSize=4, blocking=False)

    # Step 7: Continuously read and display frames
    while True:
        in_frame = video_queue.get()  # Get frame from camera
        frame = in_frame.getCvFrame()  # Convert to OpenCV format

        # Show frame
        cv2.imshow("Camera Output", frame)

        # Quit on 'q' key press
        if cv2.waitKey(1) & 0xFF == ord('q'):
            break

    # Clean up
    cv2.destroyAllWindows()

