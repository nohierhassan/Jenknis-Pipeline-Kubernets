#!/bin/bash
##########################
##    a script to automate the deployment of the image to kubernetes cluster

sed "s/tagVersion/$1/g" java-app-pod-defenition.yml > java-app-pod.yml
 