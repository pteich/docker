FROM pteich/ubuntu:latest
MAINTAINER Peter Teich <peter.teich@gmail.com>

ENV CHRONOGRAF_VERSION 0.2.0
ENV INFLUXDB_URL http://localhost:8086

RUN curl -sOL https://s3.amazonaws.com/get.influxdb.org/chronograf/chronograf_${CHRONOGRAF_VERSION}_amd64.deb && \
    dpkg -i chronograf_${CHRONOGRAF_VERSION}_amd64.deb && \
    rm -f chronograf_${CHRONOGRAF_VERSION}_amd64.deb && \
    rm -rf /var/lib/apt/lists/*

ADD run.sh /run.sh

RUN chmod +x /run.sh

# Port for Web Interface
EXPOSE 8088

CMD ["/run.sh"]
