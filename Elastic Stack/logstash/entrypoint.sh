#!/bin/bash

sed -i "s/elastic_ip/$ELASTICSEARCH_IP/g" /etc/logstash/conf.d/logstash.conf

service logstash start
while true; do sleep 1000; done 