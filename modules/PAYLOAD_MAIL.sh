#!/bin/bash

source config

LAST_IP=`cat $IP_FILE`" "
CURRENT_IP=`curl $CURL_OPTS $IP_CHECK_url`

if [ "$SEND_MAIL" = "yes" ] && [ "$CURRENT_IP" != "$LAST_IP" ]; then
  echo $CURRENT_IP > $IP_FILE
  echo "ID: $ID | IP: $CURRENT_IP" | mail -s "airloom notification" $SEND_MAIL_addr -aFrom:$SEND_MAIL_fromaddr
  echo "RUNNING PAYLOAD_MAIL"
fi

