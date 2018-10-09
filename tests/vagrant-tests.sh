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
  test "Building infrastructure with vagrant up should not fail." \
    "vagrant up > /dev/null"

  test "Running command on a vagrant node should not fail." \
    vagrant ssh bootstrap -c ls
}

function destroy-infrastructure {
  echo Tearing down vagrant infrastructure
  vagrant destroy -f > /dev/null
}

main
exit 0