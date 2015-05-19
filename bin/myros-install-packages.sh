#!/bin/bash
sudo apt-get update
sudo apt-get install -y ros-hydro-desktop-full terminator vim python-rosinstall build-essential git

sudo rosdep init
rosdep update
