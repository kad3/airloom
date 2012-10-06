#!/bin/bash

TEST_STRING=""

source config

if [ "`cat $TRIP_FILE`" = "true" ] ; then
  ./payload.sh
else
  TRIP="false"

#HTTP_CHECK
  if [ "$HTTP_CHECK" = "yes" ] ; then
    if [ "`curl $CURL_OPTS $HTTP_CHECK_url | grep $ID`" != ""  ] ; then
      TRIP="true"
      TEST_STRING="HTTP_CHECK|"
    fi
  fi
#HTTP_CHECK

#MAIL_CHECK
  if [ "$MAIL_CHECK" = "yes" ] ; then
    fetchmail -f fetchmailrc
    if [ "`mail --print | grep $ID`" != "" ] ; then
      TRIP="true"
      TEST_STRING=$TEST_STRING"MAIL_CHECK|"
    fi
  fi
#MAIL_CHECK

  echo $TEST_STRING

  if [ "$TRIP" = "true" ] ; then
    echo true > $TRIP_FILE
    ./payload.sh
  fi

fi

