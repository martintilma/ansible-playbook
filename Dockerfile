FROM ubuntu:latest
LABEL maintainer="Martin Tilma"

RUN apt-get update && \
    apt-get -y install software-properties-common less openssh-client && \
    apt-get -y install python3 python3-venv python3-pip && \
    apt-get clean all && \
    rm -rf /var/lib/apt/lists/*;

RUN useradd -ms /bin/bash user && mkdir /python && chown user:user /python

USER user
RUN python3 -m venv /python --system-site-packages && . /python/bin/activate && pip3 --no-cache-dir install ansible exoscale;

WORKDIR /playbook/

ENV PATH="$PATH:/python/bin"

ENTRYPOINT ["ansible-playbook"]
