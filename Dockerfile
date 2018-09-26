FROM ubuntu:latest

RUN apt update
RUN apt -y dist-upgrade
RUN apt -y install software-properties-common
RUN apt-add-repository -y ppa:ansible/ansible
RUN apt update
RUN apt -y install ansible

ENTRYPOINT ["ansible-playbook"]
