#!/bin/sh

printf '%s' "zookeeper: "
$(nc -z -v localhost 12181)

printf '%s' "kafka-1: "
$(nc -v -z localhost 19092)

printf '%s' "kafka-2: "
$(nc -v -z localhost 29092)

printf '%s' "kafka-3: "
$(nc -v -z localhost 39092)

printf '%s' "jmxexporter: "
$(nc -v -z localhost 15556)

printf '%s' "lagexporter: "
$(nc -v -z localhost 18000)

printf '%s' "kafka_exporter: "
$(nc -v -z localhost 19308)

printf '%s' "cmak: "
$(nc -v -z localhost 19000)

printf '%s' "grafana: "
$(nc -v -z localhost 13000)

printf '%s' "prometheus: "
$(nc -v -z localhost 19090)

exit 0
