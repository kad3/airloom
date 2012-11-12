#!/bin/bash

source config

if [ "$MAIL_CHECK" = "yes" ] ; then
    echo "RUNNING CHECK_MAIL"
  fetchmail -f fetchmailrc
  if [ "`mail --print | grep $ID`" != "" ] ; then
    TRIP="true"
  fi

  if [ -f $MAIL ] ; then
    echo "" > $MAIL
  elif [ -f /var/mail/$USERNAME ] ; then
    echo "" > /var/mail/$USERNAME
  elif [ -f /var/spool/mail/$USERNAME ] ; then
    echo "" > /var/spool/mail/$USERNAME
  fi

fi


if [ "$TRIP" = "true" ] ; then
  echo true > $TRIP_FILE
  echo "CHECK_MAIL TRIPPED"
fi

