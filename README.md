# Ansible from a docker image

* ubuntu:latest (LTS version)
* Ansible 2.6.x (latest from pip)
* Couldstack python module https://github.com/exoscale/cs so we can use: https://docs.ansible.com/ansible/2.6/scenario_guides/guide_cloudstack.html


The default working directory in the image is set to `/playbook`

To run the playbook site.yml:
`docker run -it -v "$PWD":/playbook/ martintilma/ansible-playbook site.yml`

To run with a directory `secrets` mounted as `/root` to pass a `.cloudstack.ini` run:

`docker run -it -v "$PWD":/playbook/ -v "$PWD/secrets/":/root/ ansible-playbook site.yml`

.cloudstack.ini file:
```
[cloudstack]
endpoint = https://api.exoscale.ch/compute
key = **************
secret = **************
```
