#!/bin/bash

source config

LAST_IP=`cat $IP_FILE`" "
CURRENT_IP=`curl $CURL_OPTS $IP_CHECK_url`

#SEND_MAIL
if [ "$SEND_MAIL" = "yes" ] && [ "$CURRENT_IP" != "$LAST_IP" ]; then
  echo $CURRENT_IP > $IP_FILE
  echo "ID: $ID | IP: $CURRENT_IP" | mail -s "airloom notification" $SEND_MAIL_addr -aFrom:$SEND_MAIL_fromaddr
fi
#SEND_MAIL

#SSH
if [ "$SSH" = "yes" ] && [ "`ps aux | grep $SSH_user@$SSH_host | grep ssh`" = "" ]; then
  echo "SSH CLIENT STARTED"
  ssh -N -f -R $SSH_rev -p $SSH_port $SSH_user@$SSH_host
fi
#SSH

#DEL_FILES
if [ "$DEL_FILES" = "yes" ] && [ -f "$DEL_FILES_list" ]; then
  exec 3<&0
  exec 0< "$DEL_FILES_list"
  while read -r line; do
    $DEL_FILES_command $line
  done
fi
#DEL_FILES
