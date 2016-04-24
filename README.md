# lambdacube-docker

[![Build Status](https://travis-ci.org/lambdacube3d/lambdacube-docker.svg?branch=master)](https://travis-ci.org/lambdacube3d/lambdacube-docker)

Scripts to create lambdacube development environment as a Docker image.

The created docker image serves two purposes, the first is to help
newcomers to start as early as possible, the second is to speed up
the travis build.

## Development with docker

The lambdacube development environment is packed as a docker image to facilitate
the first steps of a new developer as everything related to the project is packed
in this repo/image.

Usage with docker:

 1. Install docker on your machine [See more...](https://docs.docker.com/)
 1. `docker pull lambdacube3d/lambdacube3d` [See more...](https://hub.docker.com/r/lambdacube3d/lambdacube3d/)
 1. Git clone `lambdacube-compiler` [See more...](https://github.com/lambdacube3d/lambdacube-compiler)
 1. Git clone `lambdacube-ir` [See more...](https://github.com/lambdacube3d/lambdacube-ir)
 1. `./dev.sh /path/to/lambdacube-compiler /path/to/lambdacube-ir`
    The docker image has two optional volumes one is to the compiler and
    the other is to the ir, which is mainly a technical thing.
    This command will open a bash terminal on the docker image. You can
    use the installed ghc toolset to build and test the lambdacube compiler.
 1. Go to `/root/source/lambdacube-compiler/src` in the docker terminal
 1. Hack on the desired functionality outside the docker terminal.
 1. Run the test suite within the docker terminal like `./run-test-suite.sh`
 1. When you are done create a pull request

### Howto bump lambdacube-compiler + lambdacube-ir submodules in this repo

 1. `git pull` in this repo
 1. `git submodule update`
 1. `(cd lambdacube-compiler; git pull)`
 1. git commit
 1. `git push`


## Development without docker

It is not mandatory to use the docker image to develop lambdacube3d-compiler.
In that case, the user has to install GHC and all related machinery to compile
the lambdacube3d compiler. The regular GHC and Cabal installation process is
enough to install the lambdacube-compiler and lambdacube-ir
