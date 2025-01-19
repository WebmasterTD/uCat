#!/bin/sh

apt update
apt upgrade

apt install git -y
git clone https://github.com/WebmasterTD/uConCat.git

apt install stow -y
stow dotfiles

sway
xwayland 


waybar
fonts-font-awesome

pulseaudio pavucontrol


# wofi
tofi

sway-notification-center

wlogout