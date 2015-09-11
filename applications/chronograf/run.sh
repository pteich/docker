#!/bin/bash

echo "=> Starting Chronograf ..."

exec /opt/chronograf/chronograf -bind=0.0.0.0:8088 -influx=$INFLUXDB_URL
