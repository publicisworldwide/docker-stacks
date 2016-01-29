#!/bin/bash
set -e

# Make sure we're not confused by old, incompletely-shutdown httpd
# context after restarting the container.  httpd won't start correctly
# if it thinks it is already running.
rm -rf /etc/httpd/run/* /tmp/httpd*

exec /usr/sbin/apachectl -DFOREGROUND
