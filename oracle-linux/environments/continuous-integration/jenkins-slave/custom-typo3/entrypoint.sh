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

echo Waiting 2s..
sleep 2s

echo Starting tails..

for logfile in /var/log/phantomjs/main.log /var/log/httpd/{error,access}_log /var/log/selenium-server/*log ; do
  echo Executing tail -f "$logfile" ..
  tail -f "$logfile" &
done

echo Startup done. Entering infinite loop..

while : ; do sleep 1s ; done