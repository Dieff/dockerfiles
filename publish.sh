#!/bin/bash
set -e

# login to docker
DOCKER_USER=$(head -n 1 ~/.dockerhub)
DOCKER_PASS=$(head -n 2 ~/.dockerhub | tail -n 1)

if [ -z $DOCKER_USER ] || [ -z $DOCKER_PASS ]; then
  echo "could not find docker secrets"
fi

docker login -u $DOCKER_USER -p $DOCKER_PASS

# build and push each image
for dir in */; do
  cd "${dir}"
  echo "building in $dir"
  image_name=$(cat repo):latest
  docker build . -t $image_name
  echo "built $image_name"
  docker push $image_name
  echo "pushed $image_name"
  cd ..
done
