FROM ubuntu:latest
LABEL maintainer="Martin Tilma"

RUN apt update && \
    apt -y install software-properties-common less openssh-client && \
    apt -y install python3 python3-pip && \
    apt-get clean all && \
    rm -rf /var/lib/apt/lists/*;

RUN useradd -ms /bin/bash -d /playbook/ user

USER user
RUN pip3 --no-cache-dir install --user --no-warn-script ansible exoscale;

WORKDIR /playbook/

ENV PATH="$PATH:/playbook/.local/bin"

ENTRYPOINT ["ansible-playbook"]
