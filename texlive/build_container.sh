#!/usr/bin/env bash

docker build --tag "${1:-listx/texlive:2020}" .
