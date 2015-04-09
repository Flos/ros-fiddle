#!/bin/bash
POINTCLOUD_CAM="pointcloud_to_cam.txt"
CAM_POINTCLOUD="cam_to_pointcloud.txt"

rm $POINTCLOUD_CAM.tmp
rm $CAM_POINTCLOUD.tmp

for D in `find . -mindepth 1 -type d`
do
  CALIB_ITERATIONS=$(tail -n 4 $D/calibration.log | head -n1)
  CALIB_TIME=$(tail -n 3 $D/calibration.log | head -n1)
  CALIB_CAM_POINT=$(tail -n 2 $D/calibration.log | head -n 1)
  echo "$D $CALIB_CAM_POINT $CALIB_TIME $CALIB_ITERATIONS" >> $POINTCLOUD_CAM.tmp

  CALIB_POINT_CAM=$(tail -n 1 $D/calibration.log | head -n 1)
  echo -e "$D $CALIB_POINT_CAM\t$CALIB_TIME\t$CALIB_ITERATIONS" >> $CAM_POINTCLOUD.tmp
done

rm $POINTCLOUD_CAM
rm $CAM_POINTCLOUD

sort -V $POINTCLOUD_CAM.tmp >> $POINTCLOUD_CAM
sort -V $CAM_POINTCLOUD.tmp >> $CAM_POINTCLOUD

for i in 0 1 2 3 4 5
do
   rm  "cam$i.txt"
   cat $CAM_POINTCLOUD | grep c$i >> "cam$i.txt"

done
