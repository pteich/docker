FROM pteich/ubuntu:latest
MAINTAINER Peter Teich <peter.teich@gmail.com>

ENV CHRONOGRAF_VERSION 0.3.2
ENV INFLUXDB_URL http://localhost:8086

RUN curl -sOL https://s3.amazonaws.com/get.influxdb.org/chronograf/chronograf_${CHRONOGRAF_VERSION}_amd64.deb && \
    dpkg -i chronograf_${CHRONOGRAF_VERSION}_amd64.deb && \
    rm -f chronograf_${CHRONOGRAF_VERSION}_amd64.deb && \
    rm -rf /var/lib/apt/lists/*

# Port for Web Interface
EXPOSE 8088

VOLUME ["/opt/etc/chronograf.toml"]

ENTRYPOINT ["/opt/chronograf/chronograf"]
CMD ["-config=/opt/etc/chronograf.toml"]
