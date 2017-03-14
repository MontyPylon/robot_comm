# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "robot_comm: 1 messages, 0 services")

set(MSG_I_FLAGS "-Irobot_comm:/home/montypylon/soccer_robot_ws/src/robot_comm/msg;-Istd_msgs:/opt/ros/indigo/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(genlisp REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(robot_comm_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/montypylon/soccer_robot_ws/src/robot_comm/msg/Motor.msg" NAME_WE)
add_custom_target(_robot_comm_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "robot_comm" "/home/montypylon/soccer_robot_ws/src/robot_comm/msg/Motor.msg" ""
)

#
#  langs = gencpp;genlisp;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(robot_comm
  "/home/montypylon/soccer_robot_ws/src/robot_comm/msg/Motor.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/robot_comm
)

### Generating Services

### Generating Module File
_generate_module_cpp(robot_comm
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/robot_comm
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(robot_comm_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(robot_comm_generate_messages robot_comm_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/montypylon/soccer_robot_ws/src/robot_comm/msg/Motor.msg" NAME_WE)
add_dependencies(robot_comm_generate_messages_cpp _robot_comm_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(robot_comm_gencpp)
add_dependencies(robot_comm_gencpp robot_comm_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS robot_comm_generate_messages_cpp)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(robot_comm
  "/home/montypylon/soccer_robot_ws/src/robot_comm/msg/Motor.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/robot_comm
)

### Generating Services

### Generating Module File
_generate_module_lisp(robot_comm
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/robot_comm
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(robot_comm_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(robot_comm_generate_messages robot_comm_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/montypylon/soccer_robot_ws/src/robot_comm/msg/Motor.msg" NAME_WE)
add_dependencies(robot_comm_generate_messages_lisp _robot_comm_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(robot_comm_genlisp)
add_dependencies(robot_comm_genlisp robot_comm_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS robot_comm_generate_messages_lisp)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(robot_comm
  "/home/montypylon/soccer_robot_ws/src/robot_comm/msg/Motor.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robot_comm
)

### Generating Services

### Generating Module File
_generate_module_py(robot_comm
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robot_comm
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(robot_comm_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(robot_comm_generate_messages robot_comm_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/montypylon/soccer_robot_ws/src/robot_comm/msg/Motor.msg" NAME_WE)
add_dependencies(robot_comm_generate_messages_py _robot_comm_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(robot_comm_genpy)
add_dependencies(robot_comm_genpy robot_comm_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS robot_comm_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/robot_comm)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/robot_comm
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
add_dependencies(robot_comm_generate_messages_cpp std_msgs_generate_messages_cpp)

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/robot_comm)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/robot_comm
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
add_dependencies(robot_comm_generate_messages_lisp std_msgs_generate_messages_lisp)

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robot_comm)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robot_comm\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robot_comm
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
add_dependencies(robot_comm_generate_messages_py std_msgs_generate_messages_py)
