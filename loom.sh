#!/bin/bash

source config

if [ "`cat $TRIP_FILE`" = "true" ] ; then
  ./payload.sh
else
  TRIP="false"

#HTTP_CHECK
  if [ $HTTP_CHECK = "yes" ] ; then
    if [ `curl $CURL_OPTS $HTTP_CHECK_url` != ""  ] ; then
      TRIP="true"
    fi
  fi
#HTTP_CHECK

  if [ $TRIP = "true" ] ; then
    echo true > $TRIP_FILE
    ./payload.sh
  fi

fi
