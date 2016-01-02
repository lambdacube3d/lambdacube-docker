#!/bin/sh

docker run --rm -it -v $1:/root/source/lambdacube-compiler \
                    -v $2:/root/source/lambdacube-ir \
                    andorp/lambdacube \
                    /bin/bash
