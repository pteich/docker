#!/bin/bash

set -e

# Add elasticsearch as command if needed
if [ "${1:0:1}" = '-' ]; then
	set -- elasticsearch "$@"
fi

if [[ ! -d /data/elasticsearch ]]; then
	echo "=> Detected missing directories"
	echo "=> Creating ..."
	mkdir -p /data/elasticsearch
  mkdir -p /data/elasticsearch/data
  mkdir -p /data/elasticsearch/logs
  mkdir -p /data/elasticsearch/plugins
  mkdir -p /data/elasticsearch/work
  chown -R elasticsearch:elasticsearch /data
else
    echo "=> Using existing directory /data/elasticsearch"
fi

# Drop root privileges if we are running elasticsearch
if [ "$1" = 'elasticsearch' ]; then
	chown -R elasticsearch:elasticsearch /data
  echo "=> Starting ElasticSearch ..."
	exec gosu elasticsearch "$@"
fi

echo "=> Starting $@ ..."
exec "$@"
