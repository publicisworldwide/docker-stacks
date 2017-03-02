#!/bin/env bash

set -e

if [ -z "$SERVICES" ]; then
  echo Environment variable \$SERVICES not set or empty.
  exit 1
fi

echo Starting services..

for i in $SERVICES ; do
  echo Executing "$i" .. ;
  /etc/init.d/"$i" start
  /etc/init.d/"$i" status || true   # do not error if init script has no "status"
done
