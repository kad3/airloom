#!/bin/bash

source config

echo "" > $TRIP_FILE
echo "" > var/ip
if [ "`ps aux | grep $PAYLOAD_SSH_user@$SSH_host | grep ssh`" != "" ]; then
  kill `ps aux | grep $PAYLOAD_SSH_user@$SSH_host | grep ssh | awk '{ print $2 }`
fi
