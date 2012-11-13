#!/bin/bash

source config

if [ "$PAYLOAD_MAIL" = "yes" ] && [ "$1" = "true" ]; then
  echo "ID: $ID | IP: $2" | mail -s "airloom notification" $PAYLOAD_MAIL_addr -aFrom:$PAYLOAD_MAIL_fromaddr
  echo "RUNNING PAYLOAD_MAIL"
fi

