FROM debian:jessie
MAINTAINER Peter Teich <peter.teich@gmail.com>
ADD etc /etc
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && \
	apt-get upgrade -y && \
	apt-get install -y ca-certificates inotify-tools nano pwgen wget curl git && \
	apt-get clean && \
	echo -n > /var/lib/apt/extended_states
RUN mkdir /config /data
RUN useradd -u 500 core
ADD config /config
RUN chmod +x /config/config.sh
CMD /config/config.sh