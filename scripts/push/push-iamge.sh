#!/bin/bash
###############################3
###  a shell script to automate the pushing of our image to docker hub
######################################################################

echo "*******************"
echo "** Pusing Image..**"
echo "*******************"

DOCKER_USER=$1
DOCKER_PASS=$2

IMAGE="java-app"

echo "** Logging in Docker Hub **"
docker login -u $DOCKER_USER -p$DOCKER_PASS

echo "** Taging **"
docker tag $IMAGE:$BUILD_NUMBER nohierhassan/$IMAGE:$BUILD_NUMBER

echo "** Pushing **"
docker push nohierhassan/$IMAGE:$BUILD_NUMBER 