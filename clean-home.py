#!/usr/bin/python

import glob
import os

my_home = "/home/iron"
my_file1 = ".goutputstream-"
my_file2 = "libpeerconnection.log"

if os.path.isfile(my_home + "/" + my_file2):
  os.remove(my_home + "/" + my_file2)

my_rms = glob.glob(my_home + "/" + my_file1 + "*")

for my_rm in my_rms:
  rm_this = os.path.basename(my_rm)
  if os.path.isfile(my_home + "/" + rm_this):
    os.remove(my_home + "/" + rm_this)
