#!/bin/bash
~/barney/network_up.sh
screen -dmS barney-autostart -t ros
screen -S "barney-autostart" -p 0 -X stuff "roscore$(printf \\r)"
sleep 2
screen -S "barney-autostart" -X screen  -t barney
screen -S "barney-autostart" -X screen  -t rec
screen -S "barney-autostart" -X screen  -t empty
sleep 5
screen -S "barney-autostart" -p 1 -X stuff "roslaunch barney barney.launch$(printf \\r)"
screen -S "barney-autostart" -p 2 -X stuff "roslaunch barney record.launch"
