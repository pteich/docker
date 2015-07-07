FROM pteich/ubuntu:latest
MAINTAINER Peter Teich <peter.teich@gmail.com>

ADD etc /etc

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys ABF5BD827BD9BF62 && \
	apt-get update && \
	apt-get install -y nginx && \
	echo -n > /var/lib/apt/extended_states

ADD setup/nginx.conf /etc/nginx/nginx.conf
ADD setup /setup

# mountable directory
VOLUME ["/data","/config"]

RUN chmod +x /setup/setup.sh; sync && \
	/setup/setup.sh

EXPOSE 80 443
