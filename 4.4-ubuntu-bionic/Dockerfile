# MongoDB 4.4 on Ubuntu Bionic
FROM markusma/ubuntu:bionic

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 656408E390CFB1F5 \
 && echo 'deb http://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.4 multiverse' > /etc/apt/sources.list.d/mongodb-org.list \
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
