#!/bin/bash

CURRENT_FILE_PATH=$1
NEW_FILE_PATH=$2

if [[ -z "$1" || -z "$2" ]]; then
    echo "Usage: ./app.sh <current> <new>"
    exit 1
fi

xhost +local:docker

docker run -it --rm \
    -e DISPLAY=$DISPLAY \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v ${CURRENT_FILE_PATH}:/tmp/current \
    -v ${NEW_FILE_PATH}:/tmp/new \
    --user $(id -u):$(id -g) \
    meld-docker \
    meld /tmp/current /tmp/new

xhost -local:docker

