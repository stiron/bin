#!/usr/bin/python

import os
import glob

my_home = "/home/iron"

del_libpeer = "libpeerconnection.log"
if os.path.isfile(my_home + "/" + del_libpeer):
  os.remove(my_home + "/" + del_libpeer)

files = glob.glob(my_home + "/.goutput*")
for i in files:
  if os.path.isfile(i):
    os.remove(file)
