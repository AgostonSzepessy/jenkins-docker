FROM jenkins/jenkins:lts

# install docker, docker-compose, docker-machine
# see: https://docs.docker.com/engine/installation/linux/docker-ce/ubuntu/
# see: https://docs.docker.com/engine/installation/linux/linux-postinstall/
# see: https://docs.docker.com/engine/userguide/eng-image/dockerfile_best-practices/

USER root

# prerequisites for docker
RUN apt-get update \
    && apt-get -y install \
        apt-transport-https \
        ca-certificates \
        curl \
        software-properties-common \
    && rm -rf /var/lib/apt/lists/*

# docker repos
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - \
    && add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu xenial stable" \
    && add-apt-repository "deb http://mirror.csclub.uwaterloo.ca/ubuntu/ xenial main restricted universe multiverse" \
    && apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 437D05B5
    
# docker
RUN apt-get update \
    && apt-get -y install docker-ce \
    && rm -rf /var/lib/apt/lists/*
    

# docker-compose
RUN curl -L https://github.com/docker/compose/releases/download/1.18.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose \
    && chmod +x /usr/local/bin/docker-compose

# give jenkins docker rights
RUN usermod -aG docker jenkins

USER jenkins
