#!/bin/bash

set -Eeuxo pipefail

sudo apt-get update
if ! sudo apt-src location libstdc++6 >/dev/null
then
  sudo apt-src install libstdc++6
  sudo apt-get install libstdc++6-dbgsym
fi

libstdcxx6_source_directory="$(sudo apt-src location libstdc++6)"
if [ -n "${libstdcxx6_source_directory}" ]
then
  if [ ! -e "${libstdcxx6_source_directory}/src" ]
  then
    sudo mkdir -p "${libstdcxx6_source_directory}/src"
    sudo tar -xf "${libstdcxx6_source_directory}/gcc-${libstdcxx6_source_directory##*-}.tar."* -C "${libstdcxx6_source_directory}/src" --strip-components=1
  fi

  # TODO: Retrieve source code location from the library more effectively
  package_name="$(sudo apt-src name libstdc++6)"
  target_triple="$(gcc -v 2>&1 | grep 'Target: ' | sed 's/Target: //')"
  unique_id="ig5ci0"

  mkdir -p ~/.config/gdb
  echo >> ~/.config/gdb/gdbinit
  echo '# Path substitution for debugging libstdc++6 with source code' >> ~/.config/gdb/gdbinit
  
  from="/build/${package_name}-${unique_id}/${libstdcxx6_source_directory##*/}/build/${target_triple}/"
  to="${libstdcxx6_source_directory}/src/"
  echo "set substitute-path ${from} ${to}" >> ~/.config/gdb/gdbinit
fi
