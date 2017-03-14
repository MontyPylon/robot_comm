#include "ros/ros.h"
#include "std_msgs/String.h"
#include <robot_comm/Motor.h>
#include <sstream>
#include <signal.h>
#include <termios.h>

#define KEYCODE_R 0x43
#define KEYCODE_L 0x44
#define KEYCODE_U 0x41
#define KEYCODE_D 0x42
#define KEYCODE_Q 0x71

using namespace std;

int kfd = 0;
struct termios cooked, raw;

void quit(int sig) {
    (void) sig;
    tcsetattr(kfd, TCSANOW, &cooked);
    ros::shutdown();
    exit(0);
}

void teleOpCommands() {
    char c;
    bool dirty = false;

    // get the console in raw mode                                                              
    tcgetattr(kfd, &cooked);
    memcpy(&raw, &cooked, sizeof(struct termios));
    raw.c_lflag &= ~(ICANON | ECHO);
    // Setting a new line, then end of file                         
    raw.c_cc[VEOL] = 1;
    raw.c_cc[VEOF] = 2;
    tcsetattr(kfd, TCSANOW, &raw);

    puts("Reading from keyboard");
    puts("---------------------------");
    puts("Use arrow keys to move the turtle.");


    //for (;;) {
        // get the next event from the keyboard  
        if (read(kfd, &c, 1) < 0) {
            perror("read():");
            exit(-1);
        }

        switch (c) {
            case KEYCODE_L:
                cout << "LEFT" << endl;
                dirty = true;
                break;
            case KEYCODE_R:
                cout << "RIGHT" << endl;
                dirty = true;
                break;
            case KEYCODE_U:
                cout << "UP" << endl;
                dirty = true;
                break;
            case KEYCODE_D:
                cout << "DOWN" << endl;
                dirty = true;
                break;
        }

        /**
        geometry_msgs::Twist twist;
        twist.angular.z = a_scale_ * angular_;
        twist.linear.x = l_scale_ * linear_;
        if (dirty == true) {
            twist_pub_.publish(twist);
            dirty = false;
        }
         **/
    //}
}

int main(int argc, char **argv)
{
    ros::init(argc, argv, "robot_main");
    ros::NodeHandle n;
    
    ros::Publisher command_pub = n.advertise<robot_comm::Motor>("motor", 1000);
    ros::Rate loop_rate(1);
    int count = 255;
    while (ros::ok())
    {
        robot_comm::Motor msg;
        msg.name = "Robot 1";
        msg.left_power = count;
        msg.right_power = 255;
        
        teleOpCommands();
        signal(SIGINT, quit);
        
        command_pub.publish(msg);
        ros::spinOnce();
        loop_rate.sleep();
        count--;
    }
    return 0;
}