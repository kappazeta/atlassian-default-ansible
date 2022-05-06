FROM atlassian/default-image

MAINTAINER Indrek Sünter <indrek.sunter@kappazeta.eu>

ENV DEBIAN_FRONTEND=noninteractive

# Update, install pip3 and ansible
RUN apt-get update -y && \
    apt-get install -y python3-pip ansible && \
    rm -rf /var/lib/apt/lists/*

# Install AWS CLI
RUN pip3 install awscli

