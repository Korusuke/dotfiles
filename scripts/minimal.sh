#!/bin/bash

# Install docker
sudo apt install docker docker.io -y
sudo usermod -aG docker $USER

# Install docker-compose
sudo apt install docker-compose -y

# Install python3 and pip3
sudo apt install python3
sudo apt install python3-pip -y
