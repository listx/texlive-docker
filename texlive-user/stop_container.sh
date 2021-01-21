#!/usr/bin/env bash

__user=$(id -u -n)

docker stop texlive2020-${__user}
