#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail
set -o xtrace

__container_name=texlive2020-root

__container_id="$(docker ps -f name=${__container_name} -q)"

# Only run a container if it isn't already running.
if [[ -n "${__container_id}" ]]; then
    echo "${__container_name} is already running"
else
    docker run -d --rm -v /home:/home --name ${__container_name} listx/texlive:2020
fi
