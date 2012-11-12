#!/bin/bash

source config

if [ "$PAYLOAD_DEL_FILES" = "yes" ] && [ -f "$PAYLOAD_DEL_FILES_list" ]; then
  exec 3<&0
  exec 0< "$PAYLOAD_DEL_FILES_list"
  while read -r line; do
    $PAYLOAD_DEL_FILES_command $line
    echo "PAYLOAD_DEL_FILES: DELETING $line"
  done
fi

