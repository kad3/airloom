#!/bin/bash
#Required config lines:
#  CHECK_HTTP="yes"
#  CHECK_HTTP_url="some url"
#  CURL_OPTS="--silent -k"

source config

if [ "$CHECK_HTTP" = "yes" ] ; then
  if [ "`curl $CURL_OPTS $CHECK_HTTP_url | grep $ID`" != ""  ] ; then
    TRIP="true"
    echo "RUNNING CHECK_HTTP"
  fi
fi

if [ "$TRIP" = "true" ] ; then
  echo true > $TRIP_FILE
  echo "CHECK_HTTP TRIPPED"
fi

