;; Auto-generated. Do not edit!


(when (boundp 'auv_chat::ChatMsg)
  (if (not (find-package "AUV_CHAT"))
    (make-package "AUV_CHAT"))
  (shadow 'ChatMsg (find-package "AUV_CHAT")))
(unless (find-package "AUV_CHAT::CHATMSG")
  (make-package "AUV_CHAT::CHATMSG"))

(in-package "ROS")
;;//! \htmlinclude ChatMsg.msg.html


(defclass auv_chat::ChatMsg
  :super ros::object
  :slots (_sender _message ))

(defmethod auv_chat::ChatMsg
  (:init
   (&key
    ((:sender __sender) "")
    ((:message __message) "")
    )
   (send-super :init)
   (setq _sender (string __sender))
   (setq _message (string __message))
   self)
  (:sender
   (&optional __sender)
   (if __sender (setq _sender __sender)) _sender)
  (:message
   (&optional __message)
   (if __message (setq _message __message)) _message)
  (:serialization-length
   ()
   (+
    ;; string _sender
    4 (length _sender)
    ;; string _message
    4 (length _message)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _sender
       (write-long (length _sender) s) (princ _sender s)
     ;; string _message
       (write-long (length _message) s) (princ _message s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _sender
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _sender (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _message
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _message (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get auv_chat::ChatMsg :md5sum-) "985ef42f02a992c58d5de728edeb121e")
(setf (get auv_chat::ChatMsg :datatype-) "auv_chat/ChatMsg")
(setf (get auv_chat::ChatMsg :definition-)
      "string sender
string message


")



(provide :auv_chat/ChatMsg "985ef42f02a992c58d5de728edeb121e")


