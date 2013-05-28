#!/bin/bash

S_HOME="/home/iron/stuff/others/REPORTS"
MAILX=`which mailx`

fromuser="user1@domain.com"
touser="user2@domain.com"

today=`date +%Y-%m-%d`
subject="${today} Work Report"
mailfile="$S_HOME/tmolnar-${today}.txt"

function check_files {
  if [ ! -f ${mailfile} ]; then
    echo "[ERROR] The file for today does not exist!"
    exit 1
  fi
}

function reallywantit {
  read -p "Do you really want to send the daily report? [y/n] " answer
  if [ ${answer} != "y" -a ${answer} != "Y" ]; then
    echo "[INFO] Terminating the script!"
    exit 1
  fi  
}

function sendingthemail {
  echo "Sending the e-mail..."
  $MAILX -aFrom:${fromuser} -s "${subject}" ${touser} < ${mailfile}
  echo "Done!"
  sleep 5
  tail /var/log/mail.log
  exit 0
}

check_files
reallywantit
sendingthemail

