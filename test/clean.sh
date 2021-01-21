#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail
set -o xtrace

PROJECT_ROOT=$(git rev-parse --show-toplevel)

shopt -s extglob

# Remove all auxiliary TeX files.
rm -fv ${PROJECT_ROOT}/test/minimal.!(tex)
