# MongoDB 3.4 on Ubuntu Trusty
FROM markusma/ubuntu:trusty

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv BC711F9BA15703C6 \
 && echo 'deb http://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.4 multiverse' > /etc/apt/sources.list.d/mongodb-org.list \
 && apt-get update \
 && apt-get install -y --no-install-recommends --force-yes mongodb-org \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN curl -L https://github.com/tianon/gosu/releases/download/1.10/gosu-amd64 -o /usr/local/bin/gosu \
 && chmod +x /usr/local/bin/gosu

COPY etc/ /etc/
COPY bin/ /usr/local/bin/

EXPOSE 27017
VOLUME ["/var/lib/mongodb"]
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
CMD ["mongod", "--config", "/etc/mongodb/mongod.conf", "--auth"]
