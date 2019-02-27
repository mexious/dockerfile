#!/bin/bash

sed -i "s/elastic_ip/$ELASTICSEARCH_IP/g" /etc/kibana/kibana.yml

service kibana start
while true; do sleep 1000; done 