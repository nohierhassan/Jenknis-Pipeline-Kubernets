#!/bin/bash
##########################
##    a script to automate the deployment of the image to kubernetes cluster
WORKSPACE="/home/non/Documents/Jenkins Course/PipeLineProject/src/jenkins_home/workspace/java-pipeline"

sed -i "s/tagVersion/$1/g" "$WORKSPACE/scripts/deploy/java-app.yml" > java-app-pod.yml
