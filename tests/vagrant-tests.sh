#!/bin/bash

project_dir="$(dirname $( dirname $(readlink -f ${BASH_SOURCE[0]})))"
source ${project_dir}/tests/lib/test-function.sh

function main {
  cd ${project_dir}
  run-tests
  destroy-infrastructure
}

function run-tests {
  trap "destroy-infrastructure; exit 1" ERR
  echo Building vagrant infrastructure
  vagrant up

  testbash "Running command on a vagrant node should not fail." \
    "vagrant ssh client -c 'ls /vagrant'"

  testbash "Client vagrant machine can ssh into bootstrap." \
    "vagrant ssh client -c 'ssh -o StrictHostKeyChecking=no -i /home/vagrant/test_rsa vagrant@192.168.254.2 ls'"

  testbash "Running deploy script should not fail." \
    "vagrant ssh client -c 'bash /vagrant/tests/files/run-test-deploy.sh'"

  local -r node_ls_output=$(vagrant ssh bootstrap \
              -c "docker node ls --format '{{.Hostname}} {{.Status}} {{.Availability}} {{.ManagerStatus}}'"
  )
  echo docker node ls output is:
  echo $node_ls_output
  local -r number_of_docker_leaders=$(echo "${node_ls_output}" \
            | grep -v 'Connection' \
            | awk '{ print $4 }' \
            | grep '^Leader$' \
            | wc -l)
  local -r number_of_docker_nodes=$(echo "${node_ls_output}" \
            | grep -v 'Connection' \
            | awk '{ print $1 }' \
            | wc -l)

  testbash "There are 2 docker swarm nodes" \
    "test ${number_of_docker_nodes} -eq 2"

  testbash "The swarm has a leader" \
    "test ${number_of_docker_leaders} -eq 1"

  testbash "Traefik got deployed" \
    "vagrant ssh client -c 'curl --silent http://swarm.test.com:8081/ping | grep OK > /dev/null'"

  testbash "Portainer was deployed and admin account was initialized" \
    "vagrant ssh client -c 'curl --silent -I \
   -X GET \"http://portainer.test.com/api/users/admin/check\" -H  \"accept: application/json\"' | grep 204"
}

function destroy-infrastructure {
  echo Tearing down vagrant infrastructure
  vagrant destroy -f > /dev/null
}

main
exit 0