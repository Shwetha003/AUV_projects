;; Auto-generated. Do not edit!


(when (boundp 'bot_simulator::botpose)
  (if (not (find-package "BOT_SIMULATOR"))
    (make-package "BOT_SIMULATOR"))
  (shadow 'botpose (find-package "BOT_SIMULATOR")))
(unless (find-package "BOT_SIMULATOR::BOTPOSE")
  (make-package "BOT_SIMULATOR::BOTPOSE"))

(in-package "ROS")
;;//! \htmlinclude botpose.msg.html


(defclass bot_simulator::botpose
  :super ros::object
  :slots (_x _y _direction ))

(defmethod bot_simulator::botpose
  (:init
   (&key
    ((:x __x) 0)
    ((:y __y) 0)
    ((:direction __direction) "")
    )
   (send-super :init)
   (setq _x (round __x))
   (setq _y (round __y))
   (setq _direction (string __direction))
   self)
  (:x
   (&optional __x)
   (if __x (setq _x __x)) _x)
  (:y
   (&optional __y)
   (if __y (setq _y __y)) _y)
  (:direction
   (&optional __direction)
   (if __direction (setq _direction __direction)) _direction)
  (:serialization-length
   ()
   (+
    ;; int32 _x
    4
    ;; int32 _y
    4
    ;; string _direction
    4 (length _direction)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _x
       (write-long _x s)
     ;; int32 _y
       (write-long _y s)
     ;; string _direction
       (write-long (length _direction) s) (princ _direction s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _x
     (setq _x (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _y
     (setq _y (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; string _direction
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _direction (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get bot_simulator::botpose :md5sum-) "8f292931a9007358d8f0a3620e1cc931")
(setf (get bot_simulator::botpose :datatype-) "bot_simulator/botpose")
(setf (get bot_simulator::botpose :definition-)
      "int32 x
int32 y
string direction


")



(provide :bot_simulator/botpose "8f292931a9007358d8f0a3620e1cc931")


