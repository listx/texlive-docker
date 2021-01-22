#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

docker exec -it "$@" texlive2020-$(id -u -n) bash
