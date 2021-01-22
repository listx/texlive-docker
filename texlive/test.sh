#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

PROJECT_ROOT=$(git rev-parse --show-toplevel)

# Ensure we can build with the basic container.
"${PROJECT_ROOT}"/texlive/start_container.sh
"${PROJECT_ROOT}"/texlive/with_container.sh "latexmk -pdf ${PROJECT_ROOT}/test/minimal.tex"
if [[ ! -f ${PROJECT_ROOT}/test/minimal.pdf ]]; then
    echo >&2 "could not compile ${PROJECT_ROOT}/test/minimal.pdf"
    exit 1
fi

# Test that latexindent dependencies can be found.
"${PROJECT_ROOT}"/texlive/with_container.sh "${PROJECT_ROOT}/test/latexindent-dependencies.pl"
# Test that latexindent can run against minimal.tex.
"${PROJECT_ROOT}"/texlive/with_container.sh "latexindent ${PROJECT_ROOT}/test/minimal.tex"

# Cleanup.
"${PROJECT_ROOT}"/texlive/with_container.sh "${PROJECT_ROOT}/test/clean.sh"
