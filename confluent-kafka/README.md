# confluent-kafka

## Running docker-compose commands:
`$ cd /path/to/smsk-kafka-local/apache-kafka`
`$ docker-compose -f ./docker-compose.yaml up -d`
`$ docker-compose -f ./docker-compose.yaml up -d zookeeper kafka-1 kafka-2 kafka-3 kafka-4 cmak`
`$ docker-compose -f ./docker-compose.yaml stop`
`$ docker-compose -f ./docker-compose.yaml stop zookeeper kafka-1 kafka-2 kafka-3 kafka-4 cmak`


## docker commands:
`$ docker ps -a`
`$ killall Docker && open /Applications/Docker.app` -> restart docker on mac


## start, stop, status and cleanup scripts
`$ cd /path/to/smsk-kafka-local/apache-kafka`
`$ ./bin/start.sh` -> start all docker-compose services
`$ ./bin/stop.sh` -> stop all docker-compose services
`$ ./bin/status.sh` -> status of docker-compose services
`$ ./bin/cleanup.sh` -> stops and cleans up all docker-compose services


## services and ports:
zookeeper: nc -v -z localhost 12181
kafka-1: nc -v -z localhost 19092
kafka-2: nc -v -z localhost 29092
kafka-3: nc -v -z localhost 39092
lagexporter: http://localhost:18000
jmxexporter: http://localhost:15556/metrics
cmak: http://localhost:19000
grafana: http://localhost:13000
prometheus: http://localhost:19090
kafka_exporter: http://localhost:19308/metrics


### Kafka Manager:
- cmak is a kafka-manager that can help access and manage cluster in UI
- Supports all topicctl topic related commands in UI
- Displays consumergroups information except bulrush consumergroups. As bulrush uses a different schema to commit consumer offsets