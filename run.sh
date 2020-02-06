#!/bin/bash

set -e

DOCKER_BUILDKIT=1
docker build \
--build-arg JENKINS_USER="admin" \
--build-arg JENKINS_PASS="admin" \
-t burtsevyg/jenkins \
.

docker stack deploy --prune --with-registry-auth=true -c docker-compose.yaml jenkins
