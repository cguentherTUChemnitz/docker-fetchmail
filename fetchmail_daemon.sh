#!/bin/bash

while :
do
  fetchmail -k -f /data/etc/fetchmailrc
  sleep 300
done
