; Auto-generated. Do not edit!


(cl:in-package bot_simulator-msg)


;//! \htmlinclude botpose.msg.html

(cl:defclass <botpose> (roslisp-msg-protocol:ros-message)
  ((x
    :reader x
    :initarg :x
    :type cl:integer
    :initform 0)
   (y
    :reader y
    :initarg :y
    :type cl:integer
    :initform 0)
   (direction
    :reader direction
    :initarg :direction
    :type cl:string
    :initform ""))
)

(cl:defclass botpose (<botpose>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <botpose>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'botpose)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name bot_simulator-msg:<botpose> is deprecated: use bot_simulator-msg:botpose instead.")))

(cl:ensure-generic-function 'x-val :lambda-list '(m))
(cl:defmethod x-val ((m <botpose>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader bot_simulator-msg:x-val is deprecated.  Use bot_simulator-msg:x instead.")
  (x m))

(cl:ensure-generic-function 'y-val :lambda-list '(m))
(cl:defmethod y-val ((m <botpose>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader bot_simulator-msg:y-val is deprecated.  Use bot_simulator-msg:y instead.")
  (y m))

(cl:ensure-generic-function 'direction-val :lambda-list '(m))
(cl:defmethod direction-val ((m <botpose>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader bot_simulator-msg:direction-val is deprecated.  Use bot_simulator-msg:direction instead.")
  (direction m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <botpose>) ostream)
  "Serializes a message object of type '<botpose>"
  (cl:let* ((signed (cl:slot-value msg 'x)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'y)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'direction))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'direction))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <botpose>) istream)
  "Deserializes a message object of type '<botpose>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'x) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'y) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'direction) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'direction) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<botpose>)))
  "Returns string type for a message object of type '<botpose>"
  "bot_simulator/botpose")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'botpose)))
  "Returns string type for a message object of type 'botpose"
  "bot_simulator/botpose")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<botpose>)))
  "Returns md5sum for a message object of type '<botpose>"
  "8f292931a9007358d8f0a3620e1cc931")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'botpose)))
  "Returns md5sum for a message object of type 'botpose"
  "8f292931a9007358d8f0a3620e1cc931")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<botpose>)))
  "Returns full string definition for message of type '<botpose>"
  (cl:format cl:nil "int32 x~%int32 y~%string direction~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'botpose)))
  "Returns full string definition for message of type 'botpose"
  (cl:format cl:nil "int32 x~%int32 y~%string direction~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <botpose>))
  (cl:+ 0
     4
     4
     4 (cl:length (cl:slot-value msg 'direction))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <botpose>))
  "Converts a ROS message object to a list"
  (cl:list 'botpose
    (cl:cons ':x (x msg))
    (cl:cons ':y (y msg))
    (cl:cons ':direction (direction msg))
))
