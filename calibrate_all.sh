CAMERA=0
TF=0
PREFIX=""
RESTARTS=10
SEQ=5
PRECISION=0.01
RANGE="0.05 0.05 0.05 0.05 0.05"
STEPS="3 3 3 3 3 3"
WINDOW_SIZES=(1 2 3 4 5 9 10 20 40 60 80 100 120 140 160 320 640)
CAMERAS=(0 1 2 3 4)
FILTER=7
FACTOR=0.91
#KITTI_DATASET="/media/Daten/kitti/barney/fh-campus/tilted/"
KITTI_DATASET="/media/Daten/kitti/kitti/2011_09_26_drive_0005_sync/"

if [ -z "$1" ] || [ -z "$2" ] || [ -z "$3" ]; then 
	echo -e "\tusage: $0 tf path_prefix kitti_dataset"
	exit 0
else
	TF=$1
	PREFIX=$2
	KITTI_DATASET=$3
fi

for CAMERA in "${CAMERAS[@]}"
do
	for i in "${WINDOW_SIZES[@]}" 
	do
		eval rosrun kitti_calibration calibration --i $KITTI_DATASET  --filter $FILTER --restarts $RESTARTS --seq $SEQ --window ${i} --precision $PRECISION --range $RANGE --steps $STEPS --save_images 1 --p "${PREFIX}/w${i}_c${CAMERA}_${FACTOR}.${FILTER}/" --factor ${FACTOR}  --camera $CAMERA --tf $TF
	done
done
cd ${PREFIX}
eval extract_calibration.sh
exit 1
