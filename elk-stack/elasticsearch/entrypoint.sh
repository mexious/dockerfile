#!/bin/bash

sed -i "s/cluster_name/$CLUSTER_NAME/g" /etc/elasticsearch/elasticsearch.yml
sed -i "s/node_name/$NODE_NAME/g" /etc/elasticsearch/elasticsearch.yml

service elasticsearch start
while true; do sleep 1000; done 