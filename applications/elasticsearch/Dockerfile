FROM pteich/ubuntu:latest
MAINTAINER Peter Teich <peter.teich@gmail.com>

# Add Elasticsearch repository
RUN wget -qO - https://packages.elastic.co/GPG-KEY-elasticsearch | apt-key add -
ADD etc /etc

# Install Oracle JAVA 8
RUN \
  echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
  add-apt-repository -y ppa:webupd8team/java && \
  apt-get update && \
  apt-get install --no-install-recommends -y oracle-java8-installer elasticsearch && \
  rm -rf /var/lib/apt/lists/* && \
  rm -rf /var/cache/oracle-jdk8-installer && \
  curl -o /usr/local/bin/gosu -fSL "https://github.com/tianon/gosu/releases/download/1.8/gosu-$(dpkg --print-architecture)" && \
  chmod +x /usr/local/bin/gosu

ENV JAVA_HOME=/usr/lib/jvm/java-8-oracle ES_HOME=/usr/share/elasticsearch MAX_OPEN_FILES=65535 PATH=/usr/share/elasticsearch/bin:$PATH

ADD config /config

RUN ulimit -n $MAX_OPEN_FILES

# Expose ports
#   - 9200: HTTP
#   - 9300: transport
EXPOSE 9200
EXPOSE 9300

# mountable directory
VOLUME ["/config","/data"]

ADD run.sh /run.sh
RUN chmod +x /run.sh

ENTRYPOINT ["/run.sh"]

CMD ["elasticsearch", "-Des.network.host=0.0.0.0", "--default.path.conf=/config", "--default.path.home=/usr/share/elasticsearch"]
