#!/bin/bash
project_dir="$(dirname $(dirname $( dirname $(readlink -f ${BASH_SOURCE[0]}))))"
export PRIVATE_KEY=/home/vagrant/test_rsa; 
cp ${project_dir}/tests/files/hosts ${project_dir}/hosts
cp ${project_dir}/tests/files/group_vars_all ${project_dir}/group_vars/all
bash ${project_dir}/supporting-scripts/deploy.sh