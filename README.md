# Ansible from a docker image

* ubuntu:latest (LTS version)
* Ansible (latest from pip)
* [Exoscale python](https://pypi.org/project/exoscale/)

## How to use
The default working directory in the image is set to `/playbook`

To run the playbook site.yml:
`docker run --rm -it -v "$PWD":/playbook/ martintilma/ansible-playbook site.yml`

To run with a directory `secrets` mounted as `/root` to pass a config file run:

`docker run --rm -it -v "$PWD":/playbook/ -v "$PWD/secrets/":/root/ martintilma/ansible-playbook site.yml`

## Docker hub
see: https://hub.docker.com/r/martintilma/ansible-playbook/

### Versioning / tags

* 2.9.1-1.0.0 is ansible 2.9.1 and version 1.0.0 of the image
* 2.16.6-1.0.0 is ansible 2.16.6 and version 1.0.0 of the image 
