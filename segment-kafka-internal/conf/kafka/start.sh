#!/usr/bin/env bash

set -e

readonly conf="$KAFKA_HOME/config/server.properties"

#
# JMX Prometheus exporter
#
export KAFKA_OPTS="$KAFKA_OPTS -javaagent:$KAFKA_HOME/jmx_prometheus_javaagent-0.3.1.jar=7071:$KAFKA_HOME/config/kafka-prometheus-exporter.yml" \

#
# Start Kafka.
#

export JMX_PORT=9999
echo "starting kafka"
exec $KAFKA_HOME/bin/kafka-server-start.sh $conf
