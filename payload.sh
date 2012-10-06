#!/bin/bash

source config

LAST_IP=`cat var/ip`

if [ "$1" ] ; then
  CURRENT_IP=$1
else
  CURRENT_IP=`curl $CURL_OPTS $IP_CHECK_url`
fi

#SEND_MAIL
if [ $SEND_MAIL = "yes" ] ; then

  echo "ID: $ID
IP: $CURRENT_IP" | mail -s "airloom notification" $SEND_MAIL_addr -aFrom:$SEND_MAIL_fromaddr

fi
#SEND_MAIL

