FROM ubuntu:latest
LABEL maintainer="Martin Tilma"

RUN apt-get update && \
    apt-get -y install software-properties-common less openssh-client && \
    apt-get -y install python3 python3-venv python3-pip && \
    apt-get clean all && \
    rm -rf /var/lib/apt/lists/*;

RUN useradd -ms /bin/bash -d /playbook/ user

USER user
RUN python3 -m venv ~/.local --system-site-packages && . ~/.local/bin/activate && pip3 --no-cache-dir install ansible exoscale;

WORKDIR /playbook/

ENV PATH="$PATH:/playbook/.local/bin"

ENTRYPOINT ["ansible-playbook"]
