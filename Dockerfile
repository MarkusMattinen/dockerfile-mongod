# mongodb and supervisord on trusty
FROM markusma/supervisord:trusty

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10 \
 && echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' > /etc/apt/sources.list.d/10gen.list \
 && apt-get update \
 && apt-get install -y --no-install-recommends mongodb-10gen \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD config/etc/supervisor/conf.d /etc/supervisor/conf.d

EXPOSE 27017
VOLUME ["/data/db"]
