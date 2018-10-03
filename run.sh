#!/bin/bash
set -e

if [ ! -f ~/.gitconfig ]; then
    echo You must have ~/.gitconfig
    exit 1
fi

echo Building container
docker build -t crosdev --build-arg UID=$(id -u) --build-arg H=$(pwd) .

echo Running dev container
docker run --ipc=host --pid=host --net=host --uts=host --rm -it -e DISPLAY -v /run:/run -v /var/run:/var/run -v /tmp:/tmp -v ~/.gitconfig:$(pwd)/.gitconfig:ro -v $(pwd):$(pwd) --privileged -v /dev:/dev crosdev
