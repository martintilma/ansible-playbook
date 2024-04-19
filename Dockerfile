FROM ubuntu:latest
LABEL maintainer="Martin Tilma"

RUN apt update && \
    apt -y install software-properties-common less && \
    apt -y install python3 python3-pip && \
    apt-get clean all && \
    rm -rf /var/lib/apt/lists/* && \
    pip3 --no-cache-dir install ansible exoscale;

WORKDIR /playbook/

ENTRYPOINT ["ansible-playbook"]
