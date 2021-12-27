#!/bin/bash

echo -e "============================================="
echo -e "      Attempting to install following        "
echo -e "           Applications / Programs           "
echo -e "=============================================\n\n"

# adb tools
sudo apt-get install adb -y

# Install pip3
sudo apt install python3-pip -y

# Node and npm
sudo apt install nodejs npm -y
sudo npm install --global surge

# Conda
wget https://repo.anaconda.com/archive/Anaconda3-2021.11-Linux-x86_64.sh -O Anaconda.sh
chmod +x Anaconda.sh && ./Anaconda.sh -b
eval "$($HOME/anaconda3/bin/conda shell.bash hook)"
conda init
rm Anaconda.sh

# Install docker
sudo apt install docker docker.io -y
sudo usermod -aG docker $USER

# Install docker-compose
sudo apt install docker-compose -y

# awscli
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
rm -rf aws
rm -rf awscliv2.zip

# boto3
pip3 install boto3

# Installing vncviewer
curl "https://www.realvnc.com/download/file/viewer.files/VNC-Viewer-6.21.1109-Linux-x64.deb" -o "vncviewer.deb"
sudo apt install ./vncviewer.deb -y
rm vncviewer.deb

# Install rclone
sudo apt install rclone -y

# kopia-ui
curl -s https://kopia.io/signing-key | sudo apt-key add -
echo "deb http://packages.kopia.io/apt/ stable main" | sudo tee /etc/apt/sources.list.d/kopia.list
sudo apt update -y
sudo apt install kopia -y
sudo apt install kopia-ui -y

# discord
sudo apt install discord -y

# Install vscode
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor >packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg

sudo apt install apt-transport-https -y
sleep 3
sudo apt update -y
sleep 3
sudo apt install code -y

# Install chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
rm google-chrome-stable_current_amd64.deb

# Install postman
wget https://dl.pstmn.io/download/latest/linux64
sudo tar -xvf linux64 -C /usr/bin
sudo cp scripts/files/Postman.desktop /usr/share/applications/Postman.desktop
rm linux64

# Install vlc
sudo apt install vlc -y

# Install obsstudio
sudo apt install ffmpeg -y
sudo add-apt-repository ppa:obsproject/obs-studio -y
sudo apt update -y
sudo apt install obs-studio -y

# Install droidcam
curl https://files.dev47apps.net/obs/droidcam_obs_1.3_linux.zip -o "droidcam_obs.zip"
unzip droidcam_obs.zip -d droidcam
cd droidcam && ./install.sh
cd .. && rm -rf droidcam && rm droidcam_obs.zip

# Install zoom
sudo apt install libgl1-mesa-glx libegl1-mesa libxcb-xtest0 -y
wget https://zoom.us/client/latest/zoom_amd64.deb
sudo apt install ./zoom_amd64.deb -y
rm zoom_amd64.deb