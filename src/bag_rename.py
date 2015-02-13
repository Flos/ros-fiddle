#!/usr/bin/python
# message-16-error_1331045422.png --> message-16-error.png
# ladybug5_panoramic_2015-02-13-17-13-32_0.bag -> 0/ladybug5_panoramic.bag
# 0 2015-02-13-17-13-32 >> timestamp.txt
# Usage: python foo.py dir_to_change
import os, sys

dir=sys.argv[1]
timestamp_file = '/timestamps.txt'
timestamps=dir+ timestamp_file
f = open(timestamps, 'w')

for file in os.listdir(dir):
    extension_active = ''
    if file.endswith('.active'):
      file_not_active, extension_active = file.rsplit('.', 1)
      os.rename(dir+'/'+file, dir+'/'+file_not_active)
      file = file_not_active
    if not file.endswith('.bag'):
        continue
    splitted = file.split('_')
    bag_nr, extension = splitted[-1].rsplit('.', 1)
    file_new = dir + '/' + bag_nr + '/'
    if not os.path.exists(file_new): 
      os.makedirs(file_new)
      extension_active = bag_nr + '\t' + splitted[-2] +'\t' + extension_active
      f.write(extension_active + '\n')
    file_new += splitted[0]
    for x in range(1, len(splitted) - 2):
       file_new += '_' + splitted[x]
    file_new += '.' + extension
    out = ''
    if len(extension_active) > 6:
      out = extension_active + ' --> ' + timestamp_file
    print file + ' --> ' + file_new + '\t' + out
    os.rename(dir+'/'+file, file_new)
