#!/bin/sh
TIMECRON1=${TIMECRON:-300}

while :
do
  fetchmail -f /data/etc/fetchmailrc
  sleep $TIMECRON1
done
