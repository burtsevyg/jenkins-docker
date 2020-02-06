FROM jenkins/jenkins:lts
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt

ARG JENKINS_USER="admin"
ARG JENKINS_PASS="admin"

ENV JENKINS_USER $JENKINS_USER
ENV JENKINS_PASS $JENKINS_PASS

COPY CreateAdminUser.groovy /usr/share/jenkins/ref/init.groovy.d/
