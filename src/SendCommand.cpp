#include "ros/ros.h"
#include "std_msgs/String.h"
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <netdb.h>
#include <robot_comm/Motor.h>

using namespace std;

int resolvehelper(const char* hostname, int family, const char* service, sockaddr_storage* pAddr)
{
    int result;
    addrinfo* result_list = NULL;
    addrinfo hints = {};
    hints.ai_family = family;
    hints.ai_socktype = SOCK_DGRAM; // without this flag, getaddrinfo will return 3x the number of addresses (one for each socket type).
    result = getaddrinfo(hostname, service, &hints, &result_list);
    if (result == 0)
    {
        //ASSERT(result_list->ai_addrlen <= sizeof(sockaddr_in));
        memcpy(pAddr, result_list->ai_addr, result_list->ai_addrlen);
        freeaddrinfo(result_list);
    }

    return result;
}

string returnCommand(robot_comm::Motor incoming) {

    if(incoming.right_power > 255 || incoming.right_power < -255 || incoming.left_power > 255 || incoming.left_power < -255) {
        cout << "ONE POWER IS TOO LARGE" << endl;
        cout << "SENDING THIS COMMAND: +000+000" << endl;
        return "+000+000";
    }
    
    std::stringstream left;
    if(incoming.left_power >= 0) {
        left << "+" << incoming.left_power;
    } else {
        left << incoming.left_power;
    }

    std::stringstream right;
    if(incoming.right_power >= 0) {
        right << "+" << incoming.right_power;
    } else {
        right << incoming.right_power;
    }

    std::stringstream command;
    command << left.str() << right.str() << endl;
    cout << "SENDING THIS COMMAND: " << command.str() << endl;
    
    return command.str();
}

void sendMsg(robot_comm::Motor incoming) {
    int result = 0;
    int sock = socket(AF_INET, SOCK_DGRAM, 0);

    char szIP[100];

    sockaddr_in addrListen = {}; // zero-int, sin_port is 0, which picks a random port for bind.
    addrListen.sin_family = AF_INET;
    result = bind(sock, (sockaddr*)&addrListen, sizeof(addrListen));
    if (result == -1)
    {
        int lasterror = errno;
        std::cout << "error: " << lasterror;
        exit(1);
    }


    sockaddr_storage addrDest = {};
    result = resolvehelper("192.168.0.101", AF_INET, "2390", &addrDest);
    if (result != 0)
    {
        int lasterror = errno;
        std::cout << "error: " << lasterror;
        exit(1);
    }

    string command = returnCommand(incoming);
    
    const char* msg = command.c_str();
    size_t msg_length = strlen(msg);

    result = sendto(sock, msg, msg_length, 0, (sockaddr*)&addrDest, sizeof(addrDest));

    std::cout << result << " bytes sent" << std::endl;
}

void motorCallBack(const robot_comm::Motor::ConstPtr& msg)
{
    cout << "Incoming command for: " << msg->name << endl;
    cout << "Right power: " << msg->right_power << endl;
    cout << "Left power: " << msg->left_power << endl;
    sendMsg(*msg);
}

int main(int argc, char **argv)
{
    ros::init(argc, argv, "sendCommand");
    ros::NodeHandle n;
    ros::Subscriber sub = n.subscribe("/motor", 1000, motorCallBack);
    ros::spin();
    return 0;
}