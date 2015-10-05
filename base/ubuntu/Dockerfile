FROM ubuntu:14.04
MAINTAINER Peter Teich <peter.teich@gmail.com>
ADD etc /etc
ENV DEBIAN_FRONTEND=noninteractive

# install some tools for all containers based on this one
RUN apt-get update && \
	apt-get upgrade -y && \
	apt-get install -y software-properties-common htop unzip && \
	apt-get install -y ca-certificates inotify-tools nano pwgen supervisor wget curl mc git && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/* && \
	echo -n > /var/lib/apt/extended_states

# setup contains all setup scripts, all child images can use this as well
# /data will be our main data storage place
RUN mkdir /setup /data && \
	useradd -u 500 core

# mount local setup directory
ADD setup /setup

# start setup.sh
RUN chmod +x /setup/setup.sh; sync && \
	/setup/setup.sh

# default entrypoint
CMD ["/usr/bin/supervisord"]