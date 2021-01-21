#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail
set -o xtrace

docker run -d --rm -v /home:/home --name texlive2020-root listx/texlive:2020
