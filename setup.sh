#!/bin/sh

apt update
apt upgrade

apt install git -y
git clone https://github.com/WebmasterTD/uConCat.git

apt install stow -y
stow dotfiles

apt install sway -y
apt install xwayland -y


apt install waybar -y
apt install fonts-font-awesome -y


apt install wofi -y


apt install sway-notification-center