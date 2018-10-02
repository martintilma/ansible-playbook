FROM ubuntu:latest

RUN apt update && apt -y install python-pip
RUN pip install ansible cs

WORKDIR /playbook

ENTRYPOINT ["ansible-playbook"]
