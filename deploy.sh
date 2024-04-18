#!/bin/bash

# Define variables
IMAGE_NAME="kkoppin001/docker-repo-koppin:v.1"
CONTAINER_NAME="pedantic_volhard"

# Pull the latest image from DockerHub
docker pull $IMAGE_NAME

# Stop and remove the existing container
docker stop $CONTAINER_NAME
docker rm $CONTAINER_NAME

# Run a new container with the latest image
docker run -d -p 80:5000--name $CONTAINER_NAME $IMAGE_NAME

