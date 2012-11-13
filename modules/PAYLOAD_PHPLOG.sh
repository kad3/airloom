#!/bin/bash

source config

LAST_IP=`cat $IP_FILE`" "
CURRENT_IP=`curl $CURL_OPTS $IP_CHECK_url`

if [ "$PAYLOAD_PHPLOG" = "yes" ] && [ "$1" = "true" ]; then
  echo $CURRENT_IP > $IP_FILE
  echo "RUNNING PAYLOAD_PHPLOG"
  curl $CURL_OPTS "$PAYLOAD_PHPLOG_url?password=password&id=$ID&ip=$2"
fi

