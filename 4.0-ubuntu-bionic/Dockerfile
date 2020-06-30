# MongoDB 4.0 on Ubuntu Bionic
FROM markusma/ubuntu:bionic

RUN apt-get update \
 && apt-get install -y --no-install-recommends software-properties-common gnupg \
 && apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 68818C72E52529D4 \
 && echo 'deb http://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.0 multiverse' > /etc/apt/sources.list.d/mongodb-org.list \
 && apt-get update \
 && apt-get install -y --no-install-recommends mongodb-org \
 && apt-get purge -y --autoremove -o APT::AutoRemove::RecommendsImportant=false software-properties-common gnupg \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* $HOME/.cache

RUN curl -L https://github.com/tianon/gosu/releases/download/1.10/gosu-amd64 -o /usr/local/bin/gosu \
 && chmod +x /usr/local/bin/gosu

COPY etc/ /etc/
COPY bin/ /usr/local/bin/

EXPOSE 27017
VOLUME ["/var/lib/mongodb"]
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
CMD ["mongod", "--config", "/etc/mongodb/mongod.conf", "--auth"]
