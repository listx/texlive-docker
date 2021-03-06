#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

PROJECT_ROOT=$(git rev-parse --show-toplevel)

# Ensure we can build with the basic container.
"${PROJECT_ROOT}"/texlive/start_container.sh
"${PROJECT_ROOT}"/texlive/with_container.sh "cd ${PROJECT_ROOT}/test && pdflatex minimal.tex"
if [[ ! -f ${PROJECT_ROOT}/test/minimal.pdf ]]; then
    echo >&2 "could not compile ${PROJECT_ROOT}/test/minimal.pdf"
    exit 1
fi

# Test that latexindent can run against minimal.tex.
"${PROJECT_ROOT}"/texlive/with_container.sh "cd ${PROJECT_ROOT}/test && latexindent minimal.tex"

# Cleanup.
"${PROJECT_ROOT}"/texlive/with_container.sh "cd ${PROJECT_ROOT}/test && ./clean.sh"
