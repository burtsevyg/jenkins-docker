#!/bin/bash

set -e

docker stack rm jenkins
sleep 5
docker system prune --force --volumes
