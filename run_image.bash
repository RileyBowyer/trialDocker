#!/bin/bash

if [[ $# -eq 0 ]]
then
  docker run -it \
    --net=host \
    fssim:latest \
    /bin/bash 
else
  configPath=$1
  if [[ "${configPath:0:1}" == / || "${DIR:0:2}" == ~[/a-z] ]]
  then
    configDir=$configPath
  else
    configDir=$PWD"/"$configPath
  fi
  docker run -it \
    --volume="$configDir:/ws/dv_ws/src/fssim/fssim/config" \
    --net=host \
    fssim:latest \
    /bin/bash
fi