# smsk-kafka-local

There is a need for simple local setup that can mimic/help us evaluate the stage and production setup at Segment. This repository supports various flavors of kafka like  
1. apache-kafka
2. segment-kafka-internal (aka kafka-internal old kafka version)
3. confluent-kafka


## Pre-req:

- docker 20.10.17+
- docker-compose v2.10.2+
- java opendjk-8 (inorder to be in sync with segment builds)
- Log in to AWS ECR - `$ aws-okta exec ops-read -- aws ecr get-login-password | docker login --username AWS --password-stdin 528451384384.dkr.ecr.us-west-2.amazonaws.com`


## apache-kafka: (Highly recommend) Has below support for local testing 

### apache-kafka/docker-compose.yaml
- zookeeper (Build: bitnami/zookeeper)
- kafka (Build: bitnami/kafka)
- cmak (Build: segmentio build)
- prometheus (Build: prom/prometheus)
- grafana (Build: grafana/grafana)
- kafka-exporter (Build: danielqsj/kafka-exporter)
- kafka-lagexporter (Build: seglo/kafka-lag-exporter)
- jmxexporter (Build: sscaling/jmx-prometheus-exporter)
- cruise-control (Build: segmentio build - 528451384384.dkr.ecr.us-west-2.amazonaws.com/cruise-control)
- cruise-control-ui (Build: segmentio build - 528451384384.dkr.ecr.us-west-2.amazonaws.com/cruise-control-ui)
- producer (Build: 528451384384.dkr.ecr.us-west-2.amazonaws.com/smsk-kafka-load)
- consumer (Build: 528451384384.dkr.ecr.us-west-2.amazonaws.com/smsk-kafka-load)
- bulrush (Build: 528451384384.dkr.ecr.us-west-2.amazonaws.com/smsk-bulrush-test)


## segment-kafka-internal: Has below support for local testing

### segment-kafka-internal/docker-compose.yaml
- zookeeper (Build: bitnami/zookeeper)
- kafka (Build: 528451384384.dkr.ecr.us-west-2.amazonaws.com/kafka:0.10.1.1-0.18)
- cruise-control (Build: segmentio build - 528451384384.dkr.ecr.us-west-2.amazonaws.com/cruise-control)
- cruise-control-ui (Build: segmentio build - 528451384384.dkr.ecr.us-west-2.amazonaws.com/cruise-control-ui)
- cmak (Build: segmentio build)

### NOTE: 
- apache-kafka reference can be used to incoporate more services as needed


## confluent-kafka: Has below support for local testing

### confluent-kafka/docker-compose.yaml
- zookeeper (Build: confluentinc/cp-zookeeper)
- kafka (Build: confluentinc/cp-kafka)
- cmak (Build: segmentio build)
- prometheus (Build: prom/prometheus)
- grafana (Build: grafana/grafana)
- kafka-exporter (Build: danielqsj/kafka-exporter)
- kafka-lagexporter (Build: seglo/kafka-lag-exporter)
- jmxexporter (Build: sscaling/jmx-prometheus-exporter)

### NOTE: 
- apache-kafka reference can be used to incoporate more services as needed


### NOTE: 
- apache-kafka reference can be used to incoporate more features as needed
- Segement-kafka does not work with cruise-control because of older version (More testing is needed)


## Internal References:
- Kafka load generator -  https://github.com/segmentio/smsk-kafka-load
- Kafka bulrush test - https://github.com/segmentio/smsk-bulrush-test
- cruise-control - https://github.com/segmentio/cruise-control
- cruise-control-ui - https://github.com/segmentio/cruise-control-ui
- smsk-kafka - https://github.com/segmentio/images/tree/master/smsk-kafka-k8s


## External References:
- bitnami - https://github.com/bitnami/bitnami-docker-kafka#configuration
- confluent - https://hub.docker.com/u/confluentinc


### Cruise-Control external References: 
- https://catalog.us-east-1.prod.workshops.aws/workshops/c2b72b6f-666b-4596-b8bc-bafa5dcca741/en-US/cruisecontrol
- https://github.com/linkedin/cruise-control/wiki/Troubleshooting#notenoughvalidwindowsexception---not-enough-windows-available-in-range
https://docs.cloudera.com/cdp-private-cloud-base/7.1.6/cctrl-overview/topics/cctrl-self-healing.html

