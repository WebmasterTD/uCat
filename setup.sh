#!/bin/sh

apt update
apt upgrade

apt install git -y
gh
stow
chromium-browser
neovim

sway
waybar

fonts-font-awesome
fonts-noto

pulseaudio
pulsemixer


tofi

sway-notification-center

wlogout

#link config files
stow dotfiles




#sleep
cpulimit sysstat wlr-randr


/etc/systemd/logind.conf
HandlePowerKey=ignore
