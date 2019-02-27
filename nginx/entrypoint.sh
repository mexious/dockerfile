#!/bin/bash

sudo service nginx start
while true; do sleep 1d; done
exec "$@"