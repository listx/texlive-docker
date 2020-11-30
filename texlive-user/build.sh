#!/usr/bin/env bash

docker build \
    --build-arg uid=$(id -u) \
    --build-arg gid=$(id -g) \
    --tag "listx/texlive:2020-${USER}" .
