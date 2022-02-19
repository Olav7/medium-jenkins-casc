FROM jenkins/jenkins:lts-jdk11
USER root

COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh << /usr/share/jenkins/ref/plugins.txt

RUN apt-get update -y
RUN apt-get install -y apt-transport-https ca-certificates curl gnupg2 software-properties-common docker.io
RUN docker --version

RUN usermod -aG docker jenkins

USER jenkins