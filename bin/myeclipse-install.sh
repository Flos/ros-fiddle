#!/bin/bash
#Pass as argument 1 the tar filename of eclipse
if [ -z "$1" ]
  then
   echo "pleas supply the eclipse.tar filename as argument"
   exit 0
fi


sudo apt-get install -y openjdk-7-jre-headless openjdk-7-jdk

sudo mv $1 /opt/
cd /opt/ 
sudo tar xzvf $1
rm $1

myeclipse-desktop.icon.sh


