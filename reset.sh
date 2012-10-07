#!/bin/bash

source config

echo "" > $TRIP_FILE
echo "" > $IP_FILE
if [ "`ps aux | grep $SSH_user@$SSH_host | grep ssh`" != "" ]; then
  kill `ps aux | grep $SSH_user@$SSH_host | grep ssh | awk '{ print $2 }`
fi
