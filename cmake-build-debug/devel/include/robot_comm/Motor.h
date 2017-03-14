// Generated by gencpp from file robot_comm/Motor.msg
// DO NOT EDIT!


#ifndef ROBOT_COMM_MESSAGE_MOTOR_H
#define ROBOT_COMM_MESSAGE_MOTOR_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace robot_comm
{
template <class ContainerAllocator>
struct Motor_
{
  typedef Motor_<ContainerAllocator> Type;

  Motor_()
    : name()
    , right_power(0)
    , left_power(0)  {
    }
  Motor_(const ContainerAllocator& _alloc)
    : name(_alloc)
    , right_power(0)
    , left_power(0)  {
  (void)_alloc;
    }



   typedef std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  _name_type;
  _name_type name;

   typedef int16_t _right_power_type;
  _right_power_type right_power;

   typedef int16_t _left_power_type;
  _left_power_type left_power;




  typedef boost::shared_ptr< ::robot_comm::Motor_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::robot_comm::Motor_<ContainerAllocator> const> ConstPtr;

}; // struct Motor_

typedef ::robot_comm::Motor_<std::allocator<void> > Motor;

typedef boost::shared_ptr< ::robot_comm::Motor > MotorPtr;
typedef boost::shared_ptr< ::robot_comm::Motor const> MotorConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::robot_comm::Motor_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::robot_comm::Motor_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace robot_comm

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': False, 'IsMessage': True, 'HasHeader': False}
// {'robot_comm': ['/home/montypylon/soccer_robot_ws/src/robot_comm/msg'], 'std_msgs': ['/opt/ros/indigo/share/std_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::robot_comm::Motor_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::robot_comm::Motor_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::robot_comm::Motor_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::robot_comm::Motor_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::robot_comm::Motor_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::robot_comm::Motor_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::robot_comm::Motor_<ContainerAllocator> >
{
  static const char* value()
  {
    return "b3ac189d955a1f37512951a808b7a76f";
  }

  static const char* value(const ::robot_comm::Motor_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xb3ac189d955a1f37ULL;
  static const uint64_t static_value2 = 0x512951a808b7a76fULL;
};

template<class ContainerAllocator>
struct DataType< ::robot_comm::Motor_<ContainerAllocator> >
{
  static const char* value()
  {
    return "robot_comm/Motor";
  }

  static const char* value(const ::robot_comm::Motor_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::robot_comm::Motor_<ContainerAllocator> >
{
  static const char* value()
  {
    return "string name\n\
int16 right_power\n\
int16 left_power\n\
";
  }

  static const char* value(const ::robot_comm::Motor_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::robot_comm::Motor_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.name);
      stream.next(m.right_power);
      stream.next(m.left_power);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct Motor_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::robot_comm::Motor_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::robot_comm::Motor_<ContainerAllocator>& v)
  {
    s << indent << "name: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::stream(s, indent + "  ", v.name);
    s << indent << "right_power: ";
    Printer<int16_t>::stream(s, indent + "  ", v.right_power);
    s << indent << "left_power: ";
    Printer<int16_t>::stream(s, indent + "  ", v.left_power);
  }
};

} // namespace message_operations
} // namespace ros

#endif // ROBOT_COMM_MESSAGE_MOTOR_H
