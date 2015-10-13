FROM pteich/ubuntu:latest
MAINTAINER Peter Teich <peter.teich@gmail.com>

RUN apt-get update && apt-get install -y build-essential libxslt-dev libvorbis-dev && \
    rm -rf /var/lib/apt/lists/* && \
    curl -L https://github.com/karlheyes/icecast-kh/archive/icecast-2.4.0-kh2.tar.gz | tar xz && \
    cd icecast-2.4.0-kh2.tar && ./configure --prefix=/usr && make && make install && rm -fr icecast-2.4.0-kh2.tar

RUN rm /etc/localtime && ln -s /usr/share/zoneinfo/Europe/Berlin /etc/localtime

ADD setup /setup
ADD etc /etc

EXPOSE 8000

VOLUME ["/var/log/icecast", "/home/icecast"]

ENTRYPOINT ["/usr/bin/icecast"]
CMD ["-c", "/etc/icecast/streaming.xml"]
