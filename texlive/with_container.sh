#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

docker exec \
    texlive2020-root \
    bash -c "$*"
