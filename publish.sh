#!/bin/bash

# login to docker
DOCKER_USER=$(head -n 1 ~/.dockerhub)
DOCKER_PASS=$(head -n 2 ~/.dockerhub | tail -n 1)
cat $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin

# build and push each image
for dir in */; do
  cd "${dir}"
  image_name=$(cat repo):latest
  docker build . -t $image_name
  docker push $image_name
  cd ..
done
