#!/bin/bash

#check docker
if ! command -v docker > /dev/null; then
  apt install -y docker.io
fi

#check docker-compose
if ! command -v docker-compose > /dev/null; then
  apt install -y docker-compose
fi

#check java
if ! command -v java > /dev/null; then
  apt install -y default-jre
fi

#install live-platform
git clone --recurse-submodules https://github.com/sourceplusplus/live-platform
cd live-platform
git checkout 0dceb9f6c0acb25184bc18f720e68a66e5dfad92
git submodule update --init --recursive

./gradlew -p platform assembleUp
