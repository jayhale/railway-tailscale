#!/bin/sh

# Redirect logs to stdout and give them some structure
exec /usr/local/bin/containerboot 2>&1 | jq -c -R --unbuffered '
  {
    level: (if contains("error") or contains("failed") or contains("fatal") then "ERROR" else "INFO" end),
    message: (. | sub("^[0-9]{4}/[0-9]{2}/[0-9]{2} [0-9]{2}:[0-9]{2}:[0-9]{2} "; "")),
  }'