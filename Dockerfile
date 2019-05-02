FROM ubuntu:16.04
RUN groupadd -g 1001 mysql
RUN useradd -u 1001 -r -g 1001 -s /sbin/nologin \
		-c "Default Application User" mysql

RUN apt-get update
RUN apt-get install -y wget \
    && apt-get install -y lsb-release \
    && rm -rf /var/lib/apt/lists/*
RUN wget https://repo.percona.com/apt/percona-release_latest.generic_all.deb
RUN dpkg -i percona-release_latest.generic_all.deb

RUN apt-get update

ENV DEBIAN_FRONTEND noninteractive 

RUN echo "percona-server-server-5.7 percona-server-server/root_pass password $MYSQL_ROOT_PASSWORD" | debconf-set-selections
RUN echo "percona-server-server-5.7 percona-server-server/re-root-pass password $MYSQL_ROOT_PASSWORD" | debconf-set-selections
RUN apt-get install -y percona-server-server-5.7 percona-server-client-5.7

VOLUME ["/var/lib/mysql", "/var/log/mysql"]

USER mysql
EXPOSE 3306 33060
CMD ["mysqld"]