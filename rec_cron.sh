#!/bin/bash
screen -S "barney-autostart" -p 2 -X stuff "roslaunch barney record.launch$(printf \\r)"
