#!/bin/bash
docker build -t uqr/base -f Dockerfile-base .
docker build -t uqr/ws -f Dockerfile-ws . 