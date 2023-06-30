#!/bin/bash

# Load the variables from the .env file
set -a
source .env
set +a

# Set kubernetes secret from .env file
kubectl create secret generic alog-secret --from-env-file=.env 
kubectl create secret docker-registry regcred --docker-server=${DOCKER_REGISTRY_URL} --docker-username=${DOCKER_USERNAME} --docker-password=${DOCKER_PASSWORD} --docker-email=${DOCKER_EMAIL}
