#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail
set -o xtrace

docker exec \
    texlive2020-$(id -u -n) \
    bash -c "$*"
