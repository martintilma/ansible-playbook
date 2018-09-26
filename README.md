# Ansible from a docker image

The default working directory in the image is set to `/playbook`

To run a playbook:
`docker run -it -v "$PWD":/playbook/ martintilma/ansible-playbook site.yml`
