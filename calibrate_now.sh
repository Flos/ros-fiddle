CAMERA=0
TF=0
PREFIX=""
RESTARTS=10
SEQ=380
PRECISION=0.01
RANGE="0.05 0.05 0.05 0.05 0.05"
STEPS="3 3 3 5 5 5"
WINDOW_SIZES=(1 5 9 10 20 40 80 100 120 140)
FILTER=7
FACTOR=0.93
KITTI_DATASET="/media/Daten/kitti/barney/fh-campus-single/"
#KITTI_DATASET="/media/Daten/kitti/kitti/2011_09_26_drive_0005_sync/"

if [ -z "$1" ] || [ -z "$2" ] || [ -z "$3" ]; then 
	echo -e "\tusage: $0 camera_nr tf path_prefix"
	exit 0
else
	CAMERA=$1
	TF=$2
	PREFIX=$3
fi

for i in "${WINDOW_SIZES[@]}" 
do
	CAMERA=0
	eval rosrun kitti_calibration calibration --i $KITTI_DATASET  --filter $FILTER --restarts $RESTARTS --seq $SEQ --window ${i} --precision $PRECISION --range $RANGE --steps $STEPS --save_images 1 --p "${PREFIX}/w${i}_c${CAMERA}_${FACTOR}.${FILTER}/" --factor ${FACTOR}  --camera $CAMERA --tf $2
	CAMERA=1
	eval rosrun kitti_calibration calibration --i $KITTI_DATASET  --filter $FILTER --restarts $RESTARTS --seq $SEQ --window ${i} --precision $PRECISION --range $RANGE --steps $STEPS --save_images 1 --p "${PREFIX}/w${i}_c${CAMERA}_${FACTOR}.${FILTER}/" --factor ${FACTOR}  --camera $CAMERA --tf $2
	CAMERA=2
	eval rosrun kitti_calibration calibration --i $KITTI_DATASET  --filter $FILTER --restarts $RESTARTS --seq $SEQ --window ${i} --precision $PRECISION --range $RANGE --steps $STEPS --save_images 1 --p "${PREFIX}/w${i}_c${CAMERA}_${FACTOR}.${FILTER}/" --factor ${FACTOR}  --camera $CAMERA --tf $2
	CAMERA=3
	eval rosrun kitti_calibration calibration --i $KITTI_DATASET  --filter $FILTER --restarts $RESTARTS --seq $SEQ --window ${i} --precision $PRECISION --range $RANGE --steps $STEPS --save_images 1 --p "${PREFIX}/w${i}_c${CAMERA}_${FACTOR}.${FILTER}/" --factor ${FACTOR}  --camera $CAMERA --tf $2
	CAMERA=4
	eval rosrun kitti_calibration calibration --i $KITTI_DATASET  --filter $FILTER --restarts $RESTARTS --seq $SEQ --window ${i} --precision $PRECISION --range $RANGE --steps $STEPS --save_images 1 --p "${PREFIX}/w${i}_c${CAMERA}_${FACTOR}.${FILTER}/" --factor ${FACTOR}  --camera $CAMERA --tf $2
	CAMERA=5
	eval rosrun kitti_calibration calibration --i $KITTI_DATASET  --filter $FILTER --restarts $RESTARTS --seq $SEQ --window ${i} --precision $PRECISION --range $RANGE --steps $STEPS --save_images 1 --p "${PREFIX}/w${i}_c${CAMERA}_${FACTOR}.${FILTER}/" --factor ${FACTOR}  --camera $CAMERA --tf $2
done
exit 1
