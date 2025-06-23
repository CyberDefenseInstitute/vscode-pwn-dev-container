#!/bin/bash

set -Eeuxo pipefail

if [ -O "${VIRTUAL_ENV}" ]
then
  uv pip install --link-mode=copy -U pip
  uv pip install --link-mode=copy -U -r requirements.txt
fi
