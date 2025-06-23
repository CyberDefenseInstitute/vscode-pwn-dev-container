#!/bin/bash

set -Eeuxo pipefail

if [ ! -e "${VIRTUAL_ENV}/bin" ]
then
  uv venv --prompt pwndev "${VIRTUAL_ENV}"
fi

