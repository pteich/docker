#!/bin/bash

/setup/setup.sh

echo "=> Starting InfluxDB ..."

exec sudo -u influxdb /opt/influxdb/influxd -config=/config/config.toml
