FROM atlassian/default-image:3

MAINTAINER Indrek Sünter <indrek.sunter@kappazeta.eu>

ENV DEBIAN_FRONTEND=noninteractive

# Update, install pip3 and ansible
RUN apt-get update -y && \
    apt-get install -y ssh-askpass && \
    apt-get install -y python3-distutils && \
    rm -rf /var/lib/apt/lists/*

# Generate SSH keys
RUN ssh-keygen -q -f /root/.ssh/id_rsa && \
    cat /root/.ssh/id_rsa.pub

# Update pip
RUN curl -O https://bootstrap.pypa.io/get-pip.py && python3 get-pip.py

# Install AWS CLI and Ansible
RUN pip3 install awscli ansible

