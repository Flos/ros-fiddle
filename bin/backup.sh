#!/bin/bash
CURRENT_DATE=$(date +\%d-\%m-\%Y-%H\%M\%S)
FILE=${CURRENT_DATE}.tar.gz
TMP="/tmp/$FILE"
DESTINATION="bigscreen:/home/fnolden/backup/masterarbeit/compressed/$FILE"
SOURCE=/media/Daten/Dropbox/Masterarbeit/

echo Compressing thesis from: $SOURCE to: $TMP
tar -czf $TMP --exclude=".git*" -C $SOURCE . 
FILE_SIZE=$(du -k $TMP | cut -f1)
echo "Transferring $FILE_SIZE data: $TMP -> $DESTINATION"
scp -r $TMP "$DESTINATION"
rm $TMP
