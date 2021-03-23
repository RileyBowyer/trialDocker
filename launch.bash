#!/bin/bash
if [[ "$1" == "-h" || "$1" == "--help" ]]
then
  echo "Usage: launch.bash [simulation config path]"
  echo "       Defaults to config used to build image."
  exit 0
fi

if [[ $# -eq 0 ]]
then
  docker run -it \
    --net=host \
    dockerws:latest
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
    dockerws:latest
fi