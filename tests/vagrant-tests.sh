#!/bin/bash
set -eEuo pipefail

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

  testbash "Running kubectl should not fail" \
    "vagrant ssh client -c 'kubectl get nodes'"

  testbash "Longhorn dashboard is running" \
    "vagrant ssh client -c 'curl --silent -I -X GET http://longhorn.192.168.254.3.xip.io/dashboard' | grep '200 OK'"

  testbash "Running a query on the mysql cluster should not fail" \
    "vagrant ssh client -c 'bash /vagrant/tests/lib/mysql-query.sh'"
}

function destroy-infrastructure {
  echo Tearing down vagrant infrastructure
  vagrant destroy -f > /dev/null
}

main
exit 0