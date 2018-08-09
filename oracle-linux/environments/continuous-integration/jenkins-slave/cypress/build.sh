#!/usr/bin/env bash

BASE_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
docker build -t siemens_cypress:latest "${BASE_DIR}"
