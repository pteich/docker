FROM pteich/ubuntu:latest
MAINTAINER Peter Teich <peter.teich@gmail.com>

RUN curl -sOL https://s3.amazonaws.com/influxdb/influxdb_0.9.4.2_amd64.deb && \
    dpkg -i influxdb_0.9.4.2_amd64.deb && \
    rm -f influxdb_0.9.4.2_amd64.deb && \
    rm -rf /var/lib/apt/lists/*

ADD setup /setup
ADD config /config
ADD run.sh /run.sh

RUN chmod +x /setup/setup.sh && chmod +x /run.sh

# Ports for Admin, API, Raft (clustering only), Protobuf (clustering only)
EXPOSE 8083 8086 8090 8099

ENV ADMIN_USER=docker

VOLUME ["/data","/config"]

CMD ["/run.sh"]
