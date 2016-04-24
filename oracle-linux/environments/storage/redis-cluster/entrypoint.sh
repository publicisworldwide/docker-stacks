#!/bin/sh
echo port $REDIS_PORT >> /usr/local/etc/redis.conf
echo cluster-enabled yes >> /usr/local/etc/redis.conf
echo cluster-config-file nodes.conf >> /usr/local/etc/redis.conf
echo cluster-node-timeout 5000 >> /usr/local/etc/redis.conf
echo appendonly yes >> /usr/local/etc/redis.conf

set -e

# allow the container to be started with `--user`
if [ "$1" = 'redis-server' -a "$(id -u)" = '0' ]; then
	chown -R redis .
	exec gosu redis "$0" "$@"
fi

exec "$@"