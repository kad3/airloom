#!/bin/bash

source config

if [ "$DEL_FILES" = "yes" ] && [ -f "$DEL_FILES_list" ]; then
  exec 3<&0
  exec 0< "$DEL_FILES_list"
  while read -r line; do
    $DEL_FILES_command $line
    echo "PAYLOAD_DEL_FILES: DELETING $line"
  done
fi

