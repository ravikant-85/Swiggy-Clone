#!/bin/bash

# Define variables
REPO_DIR="/home/fir3/Swiggy-Clone"
DOCKER_IMAGE_NAME="swiggy"
DOCKER_CONTAINER_NAME="swiggy-container"
BRANCH_NAME=$1  # Accept branch name as the first argument

# Validate if the branch name is provided
if [ -z "$BRANCH_NAME" ]; then
    echo "Branch name is required. Exiting."
    exit 1
fi

# Navigate to the directory
cd /home/fir3

# Check if the repository exists
if [ -d "$REPO_DIR/.git" ]; then
    echo "Repository already exists. Pulling the latest changes for branch $BRANCH_NAME..."
    cd "$REPO_DIR"

    # Fetch and checkout the specified branch
    git fetch --all
    git checkout "$BRANCH_NAME"
    git status
    git log --oneline -5
    git pull
else
    echo "Repository not found. Cloning the repository..."
    git clone git@github.com:Fir3eye/Swiggy-Clone.git
    cd "$REPO_DIR"

    # Checkout the specified branch
    git checkout "$BRANCH_NAME"
fi

# Build the Docker image
echo "Building the Docker image: $DOCKER_IMAGE_NAME..."
docker build -t "$DOCKER_IMAGE_NAME" .

# Check if the container is already running
if [ "$(docker ps -q -f name=$DOCKER_CONTAINER_NAME)" ]; then
    echo "Stopping and removing the existing container: $DOCKER_CONTAINER_NAME..."
    docker stop "$DOCKER_CONTAINER_NAME"
    docker rm "$DOCKER_CONTAINER_NAME"
fi

# Run the Docker container
echo "Running the Docker container: $DOCKER_CONTAINER_NAME..."
docker run -d -p 3000:3000 --name "$DOCKER_CONTAINER_NAME" "$DOCKER_IMAGE_NAME"

# Display the running containers
echo "List of running containers:"
docker ps
