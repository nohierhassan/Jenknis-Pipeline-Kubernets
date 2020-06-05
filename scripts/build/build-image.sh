#!/bin/bash
###################################
##### a bash script to automate the creation of the java-app Docker image to prepare it for pushing it to docker hub

# copy the jar file to the current directory to build an image with it
cp java-app/target/*.jar scripts/build/

echo "*************************"
echo "** Building The Image ***"
echo "*************************"


cd scripts/build

#building the image
docker-compose build --no-cache
