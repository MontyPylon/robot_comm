; Auto-generated. Do not edit!


(cl:in-package robot_comm-msg)


;//! \htmlinclude Motor.msg.html

(cl:defclass <Motor> (roslisp-msg-protocol:ros-message)
  ((name
    :reader name
    :initarg :name
    :type cl:string
    :initform "")
   (right_power
    :reader right_power
    :initarg :right_power
    :type cl:fixnum
    :initform 0)
   (left_power
    :reader left_power
    :initarg :left_power
    :type cl:fixnum
    :initform 0))
)

(cl:defclass Motor (<Motor>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Motor>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Motor)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robot_comm-msg:<Motor> is deprecated: use robot_comm-msg:Motor instead.")))

(cl:ensure-generic-function 'name-val :lambda-list '(m))
(cl:defmethod name-val ((m <Motor>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_comm-msg:name-val is deprecated.  Use robot_comm-msg:name instead.")
  (name m))

(cl:ensure-generic-function 'right_power-val :lambda-list '(m))
(cl:defmethod right_power-val ((m <Motor>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_comm-msg:right_power-val is deprecated.  Use robot_comm-msg:right_power instead.")
  (right_power m))

(cl:ensure-generic-function 'left_power-val :lambda-list '(m))
(cl:defmethod left_power-val ((m <Motor>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_comm-msg:left_power-val is deprecated.  Use robot_comm-msg:left_power instead.")
  (left_power m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Motor>) ostream)
  "Serializes a message object of type '<Motor>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'name))
  (cl:let* ((signed (cl:slot-value msg 'right_power)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'left_power)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Motor>) istream)
  "Deserializes a message object of type '<Motor>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'right_power) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'left_power) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Motor>)))
  "Returns string type for a message object of type '<Motor>"
  "robot_comm/Motor")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Motor)))
  "Returns string type for a message object of type 'Motor"
  "robot_comm/Motor")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Motor>)))
  "Returns md5sum for a message object of type '<Motor>"
  "b3ac189d955a1f37512951a808b7a76f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Motor)))
  "Returns md5sum for a message object of type 'Motor"
  "b3ac189d955a1f37512951a808b7a76f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Motor>)))
  "Returns full string definition for message of type '<Motor>"
  (cl:format cl:nil "string name~%int16 right_power~%int16 left_power~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Motor)))
  "Returns full string definition for message of type 'Motor"
  (cl:format cl:nil "string name~%int16 right_power~%int16 left_power~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Motor>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'name))
     2
     2
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Motor>))
  "Converts a ROS message object to a list"
  (cl:list 'Motor
    (cl:cons ':name (name msg))
    (cl:cons ':right_power (right_power msg))
    (cl:cons ':left_power (left_power msg))
))
