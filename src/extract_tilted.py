#!/usr/bin/python
# Usage: python foo.py dir_to_change
import os, sys, shutil

dir=sys.argv[1]
points_folder='/velodyne_points1/data/'
new_dir=dir+'tilted/'
# 0000000527.pcd
seq=0
new_filename=""
# /0000/image_00/data/98098.jpg
# /0001/image_00/data/92334.jpg
# fused/
# fused/velodyne_points
# fused/image_00/data/image/0000000.jpg
# extraction of timestamps missing
for sub_sequence_folder in os.listdir(dir):
    if not sub_sequence_folder.isdigit():
      continue
    subfolder_path = dir+sub_sequence_folder
    #print subfolder_path
    try:
      for file in os.listdir(subfolder_path+points_folder):
        if not file.endswith('.pcd'):
          continue
        splitted = file.split('.')
        # new filename
        new_filename=str(seq).zfill(10)
        seq=seq+1
        # make point folder
        old_dir_points_file = subfolder_path + points_folder + file
        new_dir_points_folder = new_dir + 'velodyne_points/data/'
        new_dir_points_file = new_dir_points_folder + new_filename+'.pcd'
        if not os.path.exists(new_dir_points_folder): 
          os.makedirs(new_dir_points_folder)
        shutil.copyfile(old_dir_points_file, new_dir_points_file)
        print old_dir_points_file + ' --> ' + new_dir_points_file
        # Copy all images also
        image_extension=".jpg"
        for image_folder in os.listdir(subfolder_path):
          splitted_image_folders = image_folder.split('_')
          if image_folder.startswith('image'):
            new_image_folder=new_dir+image_folder+'/data/'
            old_image_filnema=subfolder_path+'/'+image_folder+'/data/'+splitted[0]+image_extension
            new_image_filename=new_image_folder+new_filename+image_extension
            if not os.path.exists(new_image_folder): 
              os.makedirs(new_image_folder)
            print  old_image_filnema +' --> ' + new_image_filename
            shutil.copyfile(old_image_filnema, new_image_filename)
    except: 
      print "Unexpected error:", sys.exc_info()[0]
      continue
	
