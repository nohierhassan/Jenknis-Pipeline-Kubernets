#!/bin/bash
##########################
##    a script to automate the deployment of the image to kubernetes cluster
WORKSPACE="/home/non/Documents/Jenkins Course/PipeLineProject/src/jenkins_home/workspace/java-pipeline"

sed "s/tagVersion/$1/g" $WORKSPACE+"/scripts/deploy/java-app-pod-defenition.yml" > java-app-pod.yml
 