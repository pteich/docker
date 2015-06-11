FROM ubuntu:14.04
MAINTAINER Peter Teich <peter.teich@gmail.com>
ADD etc /etc
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && \
	apt-get upgrade -y && \
	apt-get install -y ca-certificates inotify-tools nano pwgen supervisor unrar unzip wget curl mc git && \
	apt-get install -y build-essential && \
	apt-get install -y software-properties-common && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/* && \
	echo -n > /var/lib/apt/extended_states
RUN mkdir /config /data
RUN useradd -u 500 core
ADD config /config
RUN chmod +x /config/config.sh
CMD /config/config.sh