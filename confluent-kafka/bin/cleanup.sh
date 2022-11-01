#!/bin/sh

DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
docker-compose -f $DIR/../docker-compose.yaml stop
status=$?
if [ $status -eq 0 ]; then
   echo "Stopped docker-compose container services.."
else
   exit $status
fi

docker rm zookeeper kafka-1 kafka-2 kafka-3 
docker rm jmx_exporter kafka_exporter lag_exporter
docker rm cmak prometheus grafana

status=$?
if [ $status -eq 0 ]; then
   echo "Removed docker-compose above service containers.."
fi

rm -rf $DIR/../data/kafka/*
status=$?
if [ $status -eq 0 ]; then
   echo "Removed Kafka data.."
else
   exit $status
fi

rm -rf $DIR/../data/zookeeper/*
status=$?
if [ $status -eq 0 ]; then
   echo "Removed Zookeeper data.."
else
   exit $status
fi

echo "Pruning all Container(Not in Use) volumes.. Hit Cancel if you don't want to delete.."
sleep 5
docker volume prune --force
status=$?
if [ $status -eq 0 ]; then
   echo "Removed all Docker volumes.."
else
   exit $status
fi

exit 0
