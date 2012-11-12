#!/bin/bash

source config

if [ "$HTTP_CHECK" = "yes" ] ; then
  if [ "`curl $CURL_OPTS $HTTP_CHECK_url | grep $ID`" != ""  ] ; then
    TRIP="true"
    echo "RUNNING CHECK_HTTP"
  fi
fi

if [ "$TRIP" = "true" ] ; then
  echo true > $TRIP_FILE
  echo "CHECK_HTTP TRIPPED"
fi

