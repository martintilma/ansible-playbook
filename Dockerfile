FROM ubuntu:latest
LABEL maintainer="Martin Tilma"

# create one layer, add ansible and python-cs (Cloudstack module) and cleanup
RUN apt update && \
    apt -y install software-properties-common && \
    apt-add-repository -y ppa:ansible/ansible && \
    apt update && \
    apt -y install ansible python-cs python-sshpubkeys python-boto python-boto3 && \
    apt-get clean all && \
    rm -rf /var/lib/apt/lists/*;

WORKDIR /playbook/

ENTRYPOINT ["ansible-playbook"]
