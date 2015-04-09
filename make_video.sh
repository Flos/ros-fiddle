#!/bin/bash
VIDEO_OUT="out.avi"
VIDEO_FPS=25
VIDEO_BITRATE=2000k
VIDEO_CODEC_H264="-vcodec libx264 -profile:v high444 -refs 16 -crf 0 -preset ultrafast"
VIDEO_CODEC="-vcodec mjpeg"
IMAGE_START=0
START_NUMBER=""

if [ -z "$1" ] || [ $1 == ""] || [ $1 == " " ]; then
	echo -e "\tusage: $0 path/to/images/ video_output_name.avi (start image number)"
        exit 0
elif [ $2 -a $2 != " " ]; then
	VIDEO_OUT=$2
fi
if [ $3 -a $3 != " " ] && [ $3 != 0 ]; then
	VIDEO_FPS=$3
	echo "FPS set to $VIDEO_FPS"
fi
echo "Video out: $VIDEO_OUT, rate $VIDEO_FPS, start $START_NUMBER"
avconv -r $VIDEO_FPS $START_NUMBER -f image2 -i $1%010d.jpg $VIDEO_CODEC $VIDEO_OUT
