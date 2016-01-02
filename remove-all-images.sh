#!/bin/sh

# CAUTION: Removes all the images from docker daemon
docker rmi -f $(docker images -aq)
