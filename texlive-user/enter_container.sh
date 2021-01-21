#!/usr/bin/env bash

docker exec -it "$@" texlive2020-$(id -u -n) bash
