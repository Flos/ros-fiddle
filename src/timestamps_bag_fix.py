#!/usr/bin/env python
import rospy
import rosbag
import sys

def fix_time(bag_in, bag_out, seconds):
	with rosbag.Bag(bag_out, 'w') as outbag:
	    for topic, msg, t in rosbag.Bag(bag_in).read_messages():
	        # This also replaces tf timestamps under the assumption 
	        # that all transforms in the message share the same timestamp
	        duration = rospy.Duration(seconds)
	        if topic == "/tf" and msg.transforms:
	            outbag.write(topic, msg, (msg.transforms[0].header.stamp + duration))
	        else:
	            outbag.write(topic, msg, (msg.header.stamp + duration) if msg._has_header else t)


if __name__=="__main__":
    if len(sys.argv) < 4:
        print("usage: timestamps_bag_fix.py in.bag out.bag seconds")
    else:
        fix_time(sys.argv[1], sys.argv[2], int(sys.argv[3]))


