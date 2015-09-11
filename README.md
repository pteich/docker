#Docker Files

Repository for Docker files that are tailored for my personal needs. The goal is to provide an almost complete environement to run all my web projects.

##Base images

###Ubuntu
Base image with pre-installed supervisord. Containers that use this base image can provide their own supervisord conf in `etc/supervisor/conf.d` and it will be executed automatically.

##Applications

###Elasticsearch
Elasticsearch running on Oracle Java 8 JRE.

To start Elasticsearch and make both ports public available:

`docker run –name=elastic -d -p 9200:9200 -p 9300:9300 -v <data-dir>:/data pteich/elasticsearch`

Provide your own config file (inside mounted /data volume):

`docker run -d --name=elastic -p 9200:9200 -p 9300:9300 -v <data-dir>:/data pteich/elasticsearch -Des.config=/data/elasticsearch.yml`

###Kibana4
Kibana 4 running on NodeJS 0.12, Kibana is started via supervisord
If you link an Elasticsearch container with the named elastic, it is automatically used as Elasticsearch server:

To start Elasticsearch:

`docker run –-name=elastic -d -p 9200:9200 -p 9300:9300 -v <data-dir>:/data pteich/elasticsearch`

To start Kibana4:

`docker run --name=kibana4 --link elastic:elastic -d -p 5601:5601 pteich/kibana4`

**Environment variables (all optional):**

`ELASTICSEARCH` ES-URL http://127.0.0.1:9200

`KIBANA_INDEX` name of Kibana index, default .kibana

`DEFAULT_APP_ID` default to discover

`REQUEST_TIMEOUT` default to 300000

`SHARD_TIMEOUT` default to 0

`VERIFY_SSL` default to true

###InfluxDB

Docker Image `pteich/influxdb`

###Chronograf

Docker Image `pteich/chronograf`

##Services

###Apache+PHP

Docker Image `pteich/apache-php`

###MariaDB

Docker Image `pteich/mariadb`

###Nginx

Docker Image `pteich/nginx`

## Thanks
This repository is heavily inspired by [maxexcloo/Docker](https://github.com/maxexcloo/Docker)
