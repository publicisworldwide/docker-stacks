#!/bin/sh
set -e

sed -i 's/REDIS_PORT/'$REDIS_PORT'/g' /usr/local/etc/redis.conf

# allow the container to be started with `--user`
if [ "$1" = 'redis-server' -a "$(id -u)" = '0' ]; then
	chown -R redis .
	exec gosu redis "$0" "$@"
fi

exec "$@"