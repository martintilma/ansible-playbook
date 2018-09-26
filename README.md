# Ansible from a docker image

`docker build -t ansible-playbook .`

The default working directory in the image is set to `/playbook`

To run a playbook:

`docker run -it -v "$PWD":/playbook/ ansible-playbook site.yml`
