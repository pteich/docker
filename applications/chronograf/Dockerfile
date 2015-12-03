FROM pteich/ubuntu:latest
MAINTAINER Peter Teich <peter.teich@gmail.com>

ENV CHRONOGRAF_VERSION 0.3.2

RUN curl -sOL https://s3.amazonaws.com/get.influxdb.org/chronograf/chronograf_${CHRONOGRAF_VERSION}_amd64.deb && \
    dpkg -i chronograf_${CHRONOGRAF_VERSION}_amd64.deb && \
    rm -f chronograf_${CHRONOGRAF_VERSION}_amd64.deb && \
    rm -rf /var/lib/apt/lists/*

# Port for Web Interface
EXPOSE 10000

ADD config.toml /opt/chronograf/config.toml

VOLUME ["/opt/chronograf/chronograf.toml"]

ENTRYPOINT ["/opt/chronograf/chronograf"]
CMD ["-config=/opt/chronograf/chronograf.toml"]
