# adb tools
sudo apt-get install adb -y

# Node and npm
sudo apt install nodejs npm -y
sudo npm install --global surge

# Conda
wget https://repo.anaconda.com/archive/Anaconda3-2021.11-Linux-x86_64.sh -O Anaconda.sh
chmod +x Anaconda.sh && ./Anaconda.sh -b
eval "$($HOME/anaconda3/bin/conda shell.bash hook)"
conda init
rm Anaconda.sh

# awscli
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
rm -rf aws
rm -rf awscliv2.zip

# boto3
pip3 install boto3

# kopia-ui
curl -s https://kopia.io/signing-key | sudo apt-key add -
echo "deb http://packages.kopia.io/apt/ stable main" | sudo tee /etc/apt/sources.list.d/kopia.list
sudo apt update -y
sudo apt install kopia -y
sudo apt install kopia-ui -y
