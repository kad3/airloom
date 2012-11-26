#!/bin/bash
#Required config lines:
#  PAYLOAD_SSH=yes
#  PAYLOAD_SSH_user=remote_user
#  PAYLOAD_SSH_host=example.com
#  PAYLOAD_SSH_port=22
#  PAYLOAD_SSH_rev="19999:localhost:22"
#
#  The SSH_rev variable forwards a port on the local machine (the second one, 22) to a port on a remote machine (the first one, 19999)
#  If you're managing multiple AirLoom clients, you'll want them all forwarding to different ports on the remote machine to avoid conflict

source config

if [ "$PAYLOAD_SSH" = "yes" ] && [ "`ps aux | grep $PAYLOAD_SSH_user@$PAYLOAD_SSH_host | grep ssh`" = "" ]; then
  echo "RUNNING PAYLOAD_SSH"
  ssh -N -f -R $PAYLOAD_SSH_rev -p $PAYLOAD_SSH_port $PAYLOAD_SSH_user@$PAYLOAD_SSH_host
fi
