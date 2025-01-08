#!/bin/bash

docker build --build-arg UID=$(id -u) -t meld-docker .

