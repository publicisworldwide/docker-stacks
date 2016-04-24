FROM redis

ENV REDIS_PORT 7000

EXPOSE $REDIS_PORT

COPY entrypoint.sh /usr/local/bin/
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

CMD redis-server /usr/local/etc/redis.conf
