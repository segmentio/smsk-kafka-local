#!/bin/sh

printf '%s' "zookeeper: "
$(nc -z -v localhost 12181)

printf '%s' "kafka-0: "
$(nc -v -z localhost 19092)

printf '%s' "kafka-1: "
$(nc -v -z localhost 29092)

printf '%s' "kafka-2: "
$(nc -v -z localhost 39092)

printf '%s' "cmak: "
$(nc -v -z localhost 19000)

printf '%s' "cruise-control: "
$(nc -v -z localhost 19091)

printf '%s' "cruise-control-ui: "
$(nc -v -z localhost 9090)

exit 0
