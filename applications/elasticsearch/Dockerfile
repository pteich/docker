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
  apt-get install -y oracle-java8-installer elasticsearch && \
  rm -rf /var/lib/apt/lists/* && \
  rm -rf /var/cache/oracle-jdk8-installer

ENV JAVA_HOME /usr/lib/jvm/java-8-oracle
ENV ES_HOME=/usr/share/elasticsearch
ENV MAX_OPEN_FILES=65535

RUN ulimit -n $MAX_OPEN_FILES

# mountable directory
VOLUME ["/data"]

CMD ["$ES_HOME/bin/elasticsearch --default.config=/etc/elasticsearch/elasticsearch.yml  --default.path.home=$ES_HOME"]
