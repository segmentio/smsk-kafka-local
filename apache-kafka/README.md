# apache-kafka


## Running docker-compose commands:
`$ cd /path/to/smsk-kafka-local/apache-kafka`
`$ docker-compose -f ./docker-compose.yaml up -d`
`$ docker-compose -f ./docker-compose.yaml up -d zookeeper kafka-1 kafka-2 kafka-3 kafka-4 cmak cruise-control`
`$ docker-compose -f ./docker-compose.yaml stop`
`$ docker-compose -f ./docker-compose.yaml stop zookeeper kafka-1 kafka-2 kafka-3 kafka-4 cmak cruise-control`


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
kafka-4: nc -v -z localhost 49092
lagexporter: http://localhost:18000
jmxexporter: http://localhost:15556/metrics
cmak: http://localhost:19000
grafana: http://localhost:13000
prometheus: http://localhost:19090
kafka_exporter: http://localhost:19308/metrics
cruise-control: nc -v -z localhost 19091
cruise-control-ui: http://localhost:9090
producer-1: Check docker logs as this leverages kafka-producer-perf-test.sh
consumer-1: Check docker logs as this leverages kafka-console-consumer.sh
smsk-bulrush-test: nc -v -z localhost 3000


### Kafka Manager:
- cmak is a kafka-manager that can help access and manage cluster in UI
- Supports all topicctl topic related commands in UI
- Displays consumergroups information except bulrush consumergroups. As bulrush uses a different schema to commit consumer offsets


## Commands

### zookeeper get all brokers
`$ docker exec -it zookeeper /opt/bitnami/zookeeper/bin/zkCli.sh -server localhost:2181 ls /`

### zookeeper get active controller
`$ docker exec -u root -it zookeeper /opt/bitnami/zookeeper/bin/zkCli.sh -server localhost:2181 get /controller`

### zookeeper get brokers 
`$ docker exec -u root -it zookeeper /opt/bitnami/zookeeper/bin/zkCli.sh -server localhost:2181 ls /brokers/ids`

### kafka configs
`$ docker exec -u root -it kafka-1 cat /opt/bitnami/kafka/config/server.properties | grep -v "^$" | grep -v "^#"`

### kafka create all topics:
`$ docker exec -it kafka-1 /bin/bash`
`$ unset JMX_PORT -> as it is causing issues with kafka-run-class.sh`
`$ /opt/bitnami/kafka/bin/kafka-topics.sh --bootstrap-server kafka-1:9092 --list`

### kafka create a topic
`$ docker exec -it kafka-1 /bin/bash`
`$ unset JMX_PORT -> as it is causing issues with kafka-run-class.sh`
`$ /opt/bitnami/kafka/bin/kafka-topics.sh --bootstrap-server kafka-1:9092 --create --topic onsite-test-1 --partitions 66 --replication-factor 2  --config retention.ms=21600000`

### kafka delete a topic
`$ docker exec -it kafka-1 /bin/bash`
`$ unset JMX_PORT -> as it is causing issues with kafka-run-class.sh`
`$ unset JMX_PORT`
`$ /opt/bitnami/kafka/bin/kafka-topics.sh  --bootstrap-server kafka-1:9092 --delete --topic onsite-test-1`
