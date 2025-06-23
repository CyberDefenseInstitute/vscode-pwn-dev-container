#!/bin/bash

set -Eeuxo pipefail

cat <<EOF >> ~/.bashrc

# Get source list from the specified library
function get_source_list()
{
  if [ -z "\${1}" ]
  then
    echo "Usage: \${FUNCNAME[0]} <LIBRARY_PATH>"
    exit 1
  fi

  local library_path="\${1}"
  gdb -q "\${library_path}" -ex 'info sources' -ex 'quit' | sed -E -e 's/, /\n/g' | grep -v '^$' | grep -P '^(/|\.)' | grep -v ':$'
}
EOF

cat <<EOF >> ~/.bashrc

# Get source code and debug symbol package for the specified library
function prepare_debug_package()
{
  if [ -z "\${1}" ]
  then
    echo "Usage: \${FUNCNAME[0]} <PACKAGE_NAME>"
    exit 1
  fi

  local package_name="\${1}"
  sudo apt-src install "\${package_name}"
  sudo apt-get install "\${package_name}-dbgsym" || sudo apt-get install "\${package_name}-dbg"
}
EOF

