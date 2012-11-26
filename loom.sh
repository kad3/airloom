#!/bin/bash

source config

# Ignores the checks if AirLoom has already been tripped
if [ "`cat $TRIP_FILE`" != "true" ] ; then
  ./checks.sh
fi

if [ "`cat $TRIP_FILE`" = "true" ] ; then
  ./payload.sh
  echo "TRIPPED"
else
  echo "NOT TRIPPED"
fi

