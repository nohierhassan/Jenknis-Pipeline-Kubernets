#!/bin/bash
###################################
##### a bash script to automate the building to the JAR file 

echo "**********************"
echo "**** Building ... ****"
echo "**********************"

# We will pass the commands to the script to be executed in the maven container

WORKSPACE="/home/non/Documents/Jenkins Course/PipeLineProject/src/jenkins_home/workspace/java-pipeline"

docker run  -v "$WORKSPACE/java-app:/app" -v "/root/.m2:/root/.m2" -w /app maven:3-alpine "$@"