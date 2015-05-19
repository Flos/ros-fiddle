#!/bin/bash

dev=eth0
min=4000
param=$1
[[ -z $1 ]] && dev=$(grep -o "eth." /proc/net/dev | head -1)

function getcount
{
    echo $(grep $dev /proc/net/dev | tr ':' ' ' | tr -s ' ' | cut -d ' ' -f 3,11)
}
    
current=($(getcount))
[[ -z $current ]] && echo "No network device \"$dev\"" && exit 1

printf "%10s %4s %4s \n" Device Recv Send

for i in $(seq 1000)
do
    sleep 1
    new=($(getcount))
    recvdiff=$(( ${new[0]} - ${current[0]} ))
    senddiff=$(( ${new[1]} - ${current[1]} ))
    recvdiff=$(( $recvdiff / 1024 ))
    senddiff=$(( $senddiff / 1024 ))
    printf "%10s %4d %4d\r" $dev $recvdiff $senddiff
    if [[ $min -gt $recvdiff ]];
    then
	echo rosservice call /service/windows $param
	rosservice call /service/windows $param
	sleep 5
    fi
    current=(${new[*]})
done
