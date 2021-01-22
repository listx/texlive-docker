#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

__user=$(id -u -n)

docker stop texlive2020-${__user}
