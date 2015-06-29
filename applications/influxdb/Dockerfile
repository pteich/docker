FROM pteich/ubuntu:latest
MAINTAINER Peter Teich <peter.teich@gmail.com>

RUN curl -sOL http://influxdb.s3.amazonaws.com/influxdb_0.9.0_amd64.deb && \
    dpkg -i influxdb_0.9.0_amd64.deb && \
    rm -f influxdb_0.9.0_amd64.deb && \
    rm -rf /var/lib/apt/lists/*

ADD setup /setup
ADD etc /etc

RUN chmod +x /setup/setup.sh && /setup/setup.sh

# Admin port
EXPOSE 8083
# API port
EXPOSE 8086
# Raft port (for clustering only)
EXPOSE 8090
# Protobuf port (for clustering only)
EXPOSE 8099

VOLUME ["/data"]
