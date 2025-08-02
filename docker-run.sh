#!/bin/bash

# Set environment variables for Docker user permissions
export DOCKER_UID=$(id -u)
export DOCKER_GID=$(id -g)
export DOCKER_USER=$(id -un)
export DOCKER_GROUP=$(id -gn)

echo "Starting Docker with:"
echo "  User: $DOCKER_USER ($DOCKER_UID)"
echo "  Group: $DOCKER_GROUP ($DOCKER_GID)"

# Run docker compose with the environment variables
docker compose up "$@"