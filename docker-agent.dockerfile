FROM jenkins/jnlp-slave

USER root

RUN apt-get update && \ 
    apt-get install git \
    curl \
    gettext-base \
    # apt-transport-https \
    # ca-certificates \
    # gnupg-agent \
    software-properties-common -y

RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - && \
    apt-key fingerprint 0EBFCD88 && \
    add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
    cosmic \
    stable"


RUN apt-get update && \ 
    apt-get install docker-ce-cli -y

RUN curl -L "https://github.com/docker/compose/releases/download/1.25.5/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && \
    chmod +x /usr/local/bin/docker-compose && \
    ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
