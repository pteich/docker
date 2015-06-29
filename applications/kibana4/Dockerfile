FROM pteich/ubuntu:latest
MAINTAINER Peter Teich <peter.teich@gmail.com>

ENV KIBANA_VERSION 4.1.1
RUN curl -sL https://deb.nodesource.com/setup_0.12 | sudo bash -  && \
	apt-get -y install nodejs

RUN curl -s https://download.elastic.co/kibana/kibana/kibana-$(KIBANA_VERSION)-linux-x64.tar.gz | tar xz -C /tmp && \
	mv /tmp/kibana-* /opt/kibana

ADD setup /setup
ADD etc /etc

RUN chmod +x /setup/setup.sh && /setup/setup.sh

EXPOSE 5601
