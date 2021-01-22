#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

__user=$(id -u -n)
__group=$(id -g -n)
__uid=$(id -u)
__gid=$(id -g)

docker build \
    --build-arg user=${__user} \
    --build-arg group=${__group} \
    --build-arg uid=${__uid} \
    --build-arg gid=${__gid} \
    --tag "${1:-listx/texlive:2020-${__user}}" .
