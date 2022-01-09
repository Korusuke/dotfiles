#!/bin/bash

echo -e "======================================="
echo -e "     Installing necessary packages     "
echo -e "=======================================\n\n\n"
# install zsh
sudo apt install zsh git curl wget fzf xclip -y

echo -e "======================================="
echo -e "         Installing oh-my-zsh          "
echo -e "=======================================\n\n\n"
# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

echo -e "======================================="
echo -e "         Configuring oh-my-zsh         "
echo -e "=======================================\n\n\n"

ZSH=/home/$USER/.oh-my-zsh

mkdir -p ~/.fonts
wget -O "/home/$USER/.fonts/MesloLGS NF Regular.ttf" https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf
wget -O "/home/$USER/.fonts/MesloLGS NF Bold.ttf" https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf
wget -O "/home/$USER/.fonts/MesloLGS NF Italic.ttf" https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf
wget -O "/home/$USER/.fonts/MesloLGS NF Bold Italic.ttf" https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf

# Power level 10k
git clone https://github.com/romkatv/powerlevel10k.git $ZSH/custom/themes/powerlevel10k
# syntax - highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH/custom/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH/custom/plugins/zsh-autosuggestions

echo -e "======================================="
echo -e "           Copying .dotfiles           "
echo -e "=======================================\n\n\n"

cp .aliases ~/
cp .p10k.zsh ~/
cp .zshrc ~/

# configure conda in zsh
conda init zsh

# Change default shell
chsh -s /usr/bin/zsh $USER

echo -e "======================================="
echo -e "             ZSH Configured            "
echo -e "         Check above for errors        "
echo -e "======================================="
echo -e "            Logout and Login           "
echo -e "         to complete shell change      "
echo -e "=======================================\n\n\n"
