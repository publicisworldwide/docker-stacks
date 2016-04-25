FROM redis

ENV REDIS_PORT 7000

EXPOSE $REDIS_PORT

COPY entrypoint.sh /usr/local/bin/
COPY redis.conf /usr/local/etc/

# replace the string REDIS_PORT in redis.conf with our variable's value
RUN sed -i 's/REDIS_PORT/'$REDIS_PORT'/g' /usr/local/etc/redis.conf

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
CMD ["redis-server", "/usr/local/etc/redis.conf"]