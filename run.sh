#!/bin/bash

set -e

JENKINS_USER="admin"
JENKINS_PASS="admin"

DOCKER_BUILDKIT=1
docker build \
--build-arg JENKINS_USER=$JENKINS_USER \
--build-arg JENKINS_PASS=$JENKINS_PASS \
-t burtsevyg/jenkins \
.

docker stack deploy --prune --with-registry-auth=true -c master.yaml jenkins

sleep 40
export SLAVE_JNLP_MAC=$(curl -L -s -u $JENKINS_USER:$JENKINS_PASS -H "Jenkins-Crumb:dac7ce5614f8cb32a6ce75153aaf2398" -X GET http://127.0.0.1:8080/computer/slave/slave-agent.jnlp | sed "s/.*<application-desc main-class=\"hudson.remoting.jnlp.Main\"><argument>\([a-z0-9]*\).*/\1/")
echo $SLAVE_JNLP_MAC

docker stack deploy --prune --with-registry-auth=true -c master.yaml -c slave.yaml jenkins
