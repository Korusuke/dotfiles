#!/bin/bash

echo -e "============================================="
echo -e "      Attempting to install following        "
echo -e "           Applications / Programs           "
echo -e "=============================================\n\n"

# Install docker
sudo apt install docker docker.io -y
sudo usermod -aG docker $USER

# Install docker-compose
sudo apt install docker-compose -y

# Install python3 and pip3
sudo apt install python3
sudo apt install python3-pip -y
