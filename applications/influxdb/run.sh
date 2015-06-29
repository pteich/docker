#!/bin/bash

/setup/setup.sh

echo "=> Starting InfluxDB ..."

exec /opt/influxdb/influxd -config=/config/config.toml
