#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

PROJECT_ROOT=$(git rev-parse --show-toplevel)

# Ensure we can build with the user-based container.
"${PROJECT_ROOT}"/texlive-user/start_container.sh
"${PROJECT_ROOT}"/texlive-user/with_container.sh "cd ${PROJECT_ROOT}/test && latexmk -pdf minimal.tex"
if [[ ! -f "${PROJECT_ROOT}/test/minimal.pdf" ]]; then
    echo >&2 "could not compile ${PROJECT_ROOT}/test/minimal.pdf"
    exit 1
fi
owner_user=$(stat -c %U "${PROJECT_ROOT}/test/minimal.pdf")
owner_group=$(stat -c %G "${PROJECT_ROOT}/test/minimal.pdf")

# Ensure that the file was generated as a normal user.
if [[ "${owner_user}" != $(id -u -n) ]]; then
    echo >&2 "${PROJECT_ROOT}/test/minimal.pdf is owned by UID ${owner_user}; expected $(id -u -n)"
    exit 1
fi
if [[ "${owner_group}" != $(id -g -n) ]]; then
    echo >&2 "${PROJECT_ROOT}/test/minimal.pdf is owned by GID ${owner_group}; expected $(id -g -n)"
    exit 1
fi
