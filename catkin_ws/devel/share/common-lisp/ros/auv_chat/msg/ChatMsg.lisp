; Auto-generated. Do not edit!


(cl:in-package auv_chat-msg)


;//! \htmlinclude ChatMsg.msg.html

(cl:defclass <ChatMsg> (roslisp-msg-protocol:ros-message)
  ((sender
    :reader sender
    :initarg :sender
    :type cl:string
    :initform "")
   (message
    :reader message
    :initarg :message
    :type cl:string
    :initform ""))
)

(cl:defclass ChatMsg (<ChatMsg>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ChatMsg>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ChatMsg)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name auv_chat-msg:<ChatMsg> is deprecated: use auv_chat-msg:ChatMsg instead.")))

(cl:ensure-generic-function 'sender-val :lambda-list '(m))
(cl:defmethod sender-val ((m <ChatMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader auv_chat-msg:sender-val is deprecated.  Use auv_chat-msg:sender instead.")
  (sender m))

(cl:ensure-generic-function 'message-val :lambda-list '(m))
(cl:defmethod message-val ((m <ChatMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader auv_chat-msg:message-val is deprecated.  Use auv_chat-msg:message instead.")
  (message m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ChatMsg>) ostream)
  "Serializes a message object of type '<ChatMsg>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'sender))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'sender))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'message))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'message))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ChatMsg>) istream)
  "Deserializes a message object of type '<ChatMsg>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'sender) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'sender) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'message) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'message) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ChatMsg>)))
  "Returns string type for a message object of type '<ChatMsg>"
  "auv_chat/ChatMsg")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ChatMsg)))
  "Returns string type for a message object of type 'ChatMsg"
  "auv_chat/ChatMsg")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ChatMsg>)))
  "Returns md5sum for a message object of type '<ChatMsg>"
  "985ef42f02a992c58d5de728edeb121e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ChatMsg)))
  "Returns md5sum for a message object of type 'ChatMsg"
  "985ef42f02a992c58d5de728edeb121e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ChatMsg>)))
  "Returns full string definition for message of type '<ChatMsg>"
  (cl:format cl:nil "string sender~%string message~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ChatMsg)))
  "Returns full string definition for message of type 'ChatMsg"
  (cl:format cl:nil "string sender~%string message~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ChatMsg>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'sender))
     4 (cl:length (cl:slot-value msg 'message))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ChatMsg>))
  "Converts a ROS message object to a list"
  (cl:list 'ChatMsg
    (cl:cons ':sender (sender msg))
    (cl:cons ':message (message msg))
))
