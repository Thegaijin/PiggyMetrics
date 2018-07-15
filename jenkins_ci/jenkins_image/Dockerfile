# Dockerfile with jenkins and docker

#Get a java8 image
FROM java:8-jre

# set user as root
USER root

# update packages
RUN apt-get -y update && apt-get -y upgrade

RUN apt-get install -y --no-install-recommends apt-utils

# add jenkins user and enable login
RUN useradd jenkins --shell /bin/bash --create-home && \
    echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers && \
    usermod -u 113 jenkins

RUN mkdir -p ~/workdir && \
    apt-get install unzip && \
    cd ~/workdir && \
    wget https://releases.hashicorp.com/terraform/0.10.6/terraform_0.10.6_linux_amd64.zip && \
    unzip terraform_0.10.6_linux_amd64.zip && \
    chmod +x terraform && \
    mv terraform /usr/local/bin/ && \
    rm -r ~/workdir

RUN apt-get update -qq && apt-get install -qqy \
    apt-transport-https \
    ca-certificates \
    curl \
    wget \
    iptables \
    python \
    gnupg2 \
    software-properties-common


RUN curl -sSL https://get.docker.com/ | sh && pip install docker-compose

# Install the magic wrapper and change it's permissions
ADD ./wrapdocker /usr/local/bin/wrapdocker
RUN chmod +x /usr/local/bin/wrapdocker

# Install docker-compose
RUN curl -L https://github.com/docker/compose/releases/download/1.22.0-rc1/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
RUN chmod +x /usr/local/bin/docker-compose

# Install the magic wrapper.
ADD ./wrapdocker /usr/local/bin/wrapdocker
RUN chmod +x /usr/local/bin/wrapdocker

# image metadata
VOLUME /var/lib/docker

# Change user to Jenkins and install gcp sdk
USER jenkins
RUN curl https://sdk.cloud.google.com | bash

ENV PATH $PATH:/home/jenkins/google-cloud-sdk/bin
RUN gcloud components install kubectl beta --quiet

CMD ["wrapdocker"]