#!/usr/bin/env bash

# Install fonts for zsh
cd ~
mkdir .fonts
cd .fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/FiraCode.tar.xz
tar -xf FiraCode.tar.xz
rm FiraCode.tar.xz

# oh-my-zsh & plugins
apt update
apt install zsh -y
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true
zsh -c 'git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions'
zsh -c 'git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting'
zsh -c 'git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search'


sed -i '1 i\HISTFILE=/commandhistory/.zsh_history' ~/.zshrc
sed -i 's/\(^plugins=([^)]*\)/\1 zsh-autosuggestions zsh-syntax-highlighting zsh-history-substring-search/' ~/.zshrc

zsh -c 'git clone https://github.com/spaceship-prompt/spaceship-prompt.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/spaceship-prompt --depth=1'
zsh -c 'ln -s ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/spaceship-prompt/spaceship.zsh-theme ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/spaceship.zsh-theme'

# update theme
sed -i '/^ZSH_THEME/c\ZSH_THEME="spaceship"' ~/.zshrc
