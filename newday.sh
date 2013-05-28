#!/bin/bash

HOME="/home/iron/stuff/others/REPORTS"
template="template.tpl"
today=`date +%Y-%m-%d`

function check_files {
  if [ ! -f $HOME/${template} ]; then
    echo -e "\n[ERROR] Missing template file!\n"
    exit 1
  elif [ -f $HOME/tmolnar-${today}.txt ]; then
    echo -e "\n[ERROR] The file for today is already created!\n"
    exit 1
  fi  
}

function reallywantit {
  read -p "Do you really want to create a new daily report? [y/n] " answer
  if [ ${answer} != "y" -a ${answer} != "Y" ]; then
    echo -e "\n[INFO] Terminating the script!\n"
    exit 1
  fi  
}

function do_copy {
  echo "[INFO] Copying the template file..."
  cp $HOME/${template} tmolnar-${today}.txt
  echo "tmolnar-${today}.txt is done!"
  exit 0
}

check_files
reallywantit
do_copy
