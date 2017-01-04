FROM ubuntu:14.04

WORKDIR /usr/local/bin

COPY create_redis_cluster.bash /usr/local/bin/create_redis_cluster

RUN apt-get -y update \
    && apt-get -y upgrade \
    && apt-get -y --no-install-recommends install ruby curl \
    && gem install redis \
    && apt-get -y autoremove \
    && apt-get -y clean \
    && curl http://download.redis.io/redis-stable/src/redis-trib.rb -o redis-trib.rb \
    && mv redis-trib.rb /usr/bin/redis-trib \
    && chmod 755 /usr/bin/redis-trib \
    && chmod 755 /usr/local/bin/create_redis_cluster