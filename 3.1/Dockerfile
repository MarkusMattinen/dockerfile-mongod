# MongoDB 3.1 and supervisord on Ubuntu Trusty
FROM markusma/supervisord:trusty

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10 \
 && echo 'deb http://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.1 multiverse' > /etc/apt/sources.list.d/mongodb-org-3.1.list \
 && apt-get update \
 && apt-get install -y --no-install-recommends --force-yes mongodb-org-unstable \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD config/etc/supervisor/conf.d /etc/supervisor/conf.d

EXPOSE 27017
VOLUME ["/data/db"]
