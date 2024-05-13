FROM python:3.12-slim
LABEL maintainer="Martin Tilma"

RUN apt-get update && \
    apt-get -y install --no-install-recommends openssh-client && \
    apt-get clean all && \
    rm -rf /var/lib/apt/lists/*;

ENV VIRTUAL_ENV="/python"
RUN useradd -ms /bin/bash user && mkdir $VIRTUAL_ENV && chown user:user $VIRTUAL_ENV

USER user
RUN python3 -m venv $VIRTUAL_ENV --system-site-packages && . $VIRTUAL_ENV/bin/activate && pip3 --no-cache-dir install ansible exoscale;

WORKDIR /playbook/

ENV PATH="$VIRTUAL_ENV/bin:$PATH"
ENTRYPOINT ["ansible-playbook"]
