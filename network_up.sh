#!/bin/bash
# Wait for Network to be available.
while true
do
ping -c 1 lisa
if [[ $? == 0 ]];
then
echo ‘Network available.’
break;
else
echo ‘Network is not available, waiting..’
sleep 5
fi
done
echo ‘If you see this message, then Network was successfully loaded.’

