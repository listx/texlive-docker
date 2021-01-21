#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail
set -o xtrace

__user=$(id -u -n)

docker run -d --rm -v /home:/home --name texlive2020-${__user} listx/texlive:2020-${__user}
