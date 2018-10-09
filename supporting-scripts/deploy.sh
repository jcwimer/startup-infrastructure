#!/bin/bash
#keep adding dirname's to go up more directories.
project_dir="$(dirname $( dirname $(readlink -f ${BASH_SOURCE[0]})))"
ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook --private-key ${PRIVATE_KEY} -i ${project_dir}/hosts ${project_dir}/playbooks/multi-instance.yml