#!/bin/bash

set -Eeuxo pipefail

sudo chown _apt "${APT_SRC_LOCATION}"
sudo chown -R "${USER}:" "${VIRTUAL_ENV}"
