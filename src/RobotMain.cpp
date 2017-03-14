#include "ros/ros.h"
#include "std_msgs/String.h"
#include <robot_comm/Motor.h>
#include <sstream>
int main(int argc, char **argv)
{
    ros::init(argc, argv, "robot_main");
    ros::NodeHandle n;
    
    ros::Publisher command_pub = n.advertise<robot_comm::Motor>("motor", 1000);
    ros::Rate loop_rate(10);
    
    while (ros::ok())
    {
        robot_comm::Motor msg;
        msg.name = "Robot 1";
        msg.left_power = 255;
        msg.right_power = 255;
        
        command_pub.publish(msg);
        ros::spinOnce();
        loop_rate.sleep();
    }
    return 0;
}