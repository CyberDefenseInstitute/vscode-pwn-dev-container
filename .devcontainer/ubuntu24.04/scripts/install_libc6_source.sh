#!/bin/bash

set -Eeuxo pipefail

function get_source_list()
{
  if [ -z "${1}" ]
  then
    echo ""
    return
  fi
  local library_path="${1}"
  gdb -q "${library_path}" -ex 'info sources' -ex 'quit' | sed -E -e 's/, /\n/g' | grep -v '^$' | grep -P '^(/|\.)' | grep -v ':$'
}

sudo apt-src update
if ! sudo apt-src location libc6 >/dev/null
then
  sudo apt-src install libc6
  sudo apt-get install libc6-dbg
fi

libc6_source_directory="$(sudo apt-src location libc6)"
if [ -n "${libc6_source_directory}" ]
then
  # TODO: Retrieve source code location from the library more effectively
  temp="$(get_source_list /usr/lib/x86_64-linux-gnu/ld-linux-x86-64.so.2)"
  temp="${temp} $(get_source_list /usr/lib/x86_64-linux-gnu/libc.so.6)"
  temp="${temp} $(get_source_list /usr/lib/x86_64-linux-gnu/libthread_db.so.1)"
  temp="${temp} $(get_source_list /usr/lib/x86_64-linux-gnu/libnss_hesiod.so.2)"
  temp="${temp} $(get_source_list /usr/lib/x86_64-linux-gnu/libnsl.so.1)"
  temp="${temp} $(get_source_list /usr/lib/x86_64-linux-gnu/libmvec.so.1)"
  declare -a -r libc6_target_path_list=( $(echo "${temp}" | grep -oP '^\./[^/]+/' | sort -u ) )

  mkdir -p ~/.config/gdb
  echo >> ~/.config/gdb/gdbinit
  echo '# Path substitution for debugging libc6 with source code' >> ~/.config/gdb/gdbinit

  for path in "${libc6_target_path_list[@]}"
  do
    from="${path}"
    to="${libc6_source_directory}/${path#*/}"
    echo "set substitute-path ${from} ${to}" >> ~/.config/gdb/gdbinit
  done
fi