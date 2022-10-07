#!/usr/bin/env bash

# Add current user to docker group
# https://docs.docker.com/engine/install/linux-postinstall/

# Create a new group called docker if it doesn't already exist
if [ -z "$(grep 'docker' /etc/group)" ]; then
    echo "creating docker group"
    sudo groupadd docker
    if [ $? -ne 0 ]; then
        echo "failed to create docker group"
        exit 1
    fi
    echo "docker group created"
else
    echo "docker group already exists"
fi

# Make sure the current user is in the docker group
if [ -z "$(grep $USER /etc/group | grep docker)" ]; then
    echo "adding $USER to docker group"
    sudo usermod -aG docker $USER
    if [ $? -ne 0 ]; then
        echo "failed to add $USER to docker group"
        exit 1
    fi
    echo "$USER added to docker group"
else
    echo "user $USER already in docker group"
fi
