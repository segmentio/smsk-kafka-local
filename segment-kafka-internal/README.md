# segment-kafka-internal

## Running docker-compose commands:
`$ cd /path/to/smsk-kafka-local/apache-kafka`
`$ docker-compose -f ./docker-compose.yaml up -d`
`$ docker-compose -f ./docker-compose.yaml up -d zookeeper kafka-0 kafka-1 kafka-2 cmak`
`$ docker-compose -f ./docker-compose.yaml stop`
`$ docker-compose -f ./docker-compose.yaml stop zookeeper kafka-0 kafka-1 kafka-2 cmak`


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
kafka-0: nc -v -z localhost 19092
kafka-1: nc -v -z localhost 29092
kafka-2: nc -v -z localhost 39092
cmak: http://localhost:19000
cruise-control: nc -v -z localhost 19091
cruise-control-ui: http://localhost:9090


### Kafka Manager:
- cmak is a kafka-manager that can help access and manage cluster in UI
- Supports all topicctl topic related commands in UI
- Displays consumergroups information except bulrush consumergroups. As bulrush uses a different schema to commit consumer offsets
