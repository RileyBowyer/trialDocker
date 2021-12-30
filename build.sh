#!/bin/bash
docker build -t uqr/base -f Dockerfile-base .
docker build -t uqr/ws -f Dockerfile-ws . 

# To Transfer Image
# docker save uqr/ws:latest | bzip2 | pv | ssh user@host docker load