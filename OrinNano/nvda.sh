#!/bin/bash
#
# Script to build and run an Ubuntu 22.04 container with device access, that
#  can be used to install Orin Nano.

docker build -t orin-sdkmaanger-ubuntu22 .

xhost +local:docker

sudo docker run -it --rm \
    --net=host \
    --privileged \
    --device /dev/bus/usb:/dev/bus/usb \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -e DISPLAY=$DISPLAY \
    orin-sdkmaanger-ubuntu22 /bin/bash
