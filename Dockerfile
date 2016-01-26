FROM ubuntu:14.04

# Set locale
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8
ENV DEBIAN_FRONTEND noninteractive

# Download GHC and cabal
RUN apt-get update && \
    apt-get install -y software-properties-common && \
    add-apt-repository -y ppa:hvr/ghc && \
    apt-get update && \
    apt-get install -y cabal-install-1.22 ghc-7.10.2 ghc-7.10.2-prof cpphs happy-1.19.4 alex-3.1.4 git
ENV PATH /opt/ghc/7.10.2/bin:/opt/cabal/1.22/bin:/opt/alex/3.1.4/bin:/opt/happy/1.19.4/bin:$PATH

# Create development dirs
RUN mkdir /root/source && \
    mkdir /root/source/docker && \
    mkdir /root/source/docker/lcc && \
    mkdir /root/source/docker/lci && \
    mkdir /root/source/lambdacube-compiler && \
    mkdir /root/source/lambdacube-ir

# Copy cabal file and install dependencies
COPY lambdacube-ir /root/source/docker/lci
COPY lambdacube-compiler /root/source/docker/lcc
RUN cd /root/source/docker/lci/lambdacube-ir.haskell && \
    cabal update && \
    cabal install -j1 --only-dependencies --reorder-goals && \
    cabal install -j1 && \
    cd /root/source/docker/lcc && \
    cabal install --constraint="indentation -trifecta" -j1 --only-dependencies --reorder-goals

# Directories for sources
VOLUME "/root/source/lambdacube-ir"
VOLUME "/root/source/lambdacube-compiler"
