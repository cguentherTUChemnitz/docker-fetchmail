#!/bin/sh

while :
do
  fetchmail -f /data/etc/fetchmailrc
  sleep 300
done
