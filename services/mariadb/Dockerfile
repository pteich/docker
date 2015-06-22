FROM pteich/ubuntu:latest
MAINTAINER Peter Teich <peter.teich@gmail.com>

RUN apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xcbcb082a1bb943db && \
	echo "deb http://ftp.hosteurope.de/mirror/mariadb.org/repo/10.0/ubuntu trusty main" > /etc/apt/sources.list.d/mariadb.list && \
	apt-get update && apt-get install -y mariadb-server && \
	rm -rf /var/lib/apt/lists/*

RUN sed -i -e "s/^bind-address/#bind-address/" /etc/mysql/my.cnf && \
	sed -i -e "s/^datadir.*=.*/datadir = \/data/" /etc/mysql/my.cnf && \
	sed -i -e "s/^innodb_buffer_pool_size.*=.*/innodb_buffer_pool_size = 64M/" /etc/mysql/my.cnf

ADD etc /etc
ADD setup /setup

ENV MARIADB_DB=NONE MARIADB_USER=docker

# mountable directory
VOLUME ["/data"]

RUN chmod +x /setup/setup.sh && \
	/setup/setup.sh

