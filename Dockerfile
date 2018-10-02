FROM ubuntu:latest
LABEL maintainer="Martin Tilma"

RUN apt update
RUN apt -y dist-upgrade
RUN apt -y install software-properties-common
RUN apt-add-repository -y ppa:ansible/ansible
RUN apt update
RUN apt -y install ansible

WORKDIR /playbook/

ENTRYPOINT ["ansible-playbook"]
