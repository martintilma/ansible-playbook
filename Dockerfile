FROM ubuntu:latest

RUN apt update
RUN apt -y dist-upgrade
RUN apt -y install python-pip
RUN pip install ansible
RUN pip install cs

WORKDIR /playbook

ENTRYPOINT ["ansible-playbook"]
