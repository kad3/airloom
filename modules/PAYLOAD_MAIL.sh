#!/bin/bash
#Required config lines:
#  PAYLOAD_MAIL=yes
#  PAYLOAD_MAIL_addr=your@email.com
#  PAYLOAD_MAIL_fromaddr=some@email.com
#
#  The MAIL_fromaddr address can be anything, but keep spam filters in mind :)

source config

if [ "$PAYLOAD_MAIL" = "yes" ] && [ "$1" = "true" ]; then
  echo "ID: $ID | IP: $2" | mail -s "airloom notification" $PAYLOAD_MAIL_addr -aFrom:$PAYLOAD_MAIL_fromaddr
  echo "RUNNING PAYLOAD_MAIL"
fi

