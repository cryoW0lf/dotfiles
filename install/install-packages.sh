#!/bin/bash
set -e -o pipefail -x

echo "Install zsh"
sudo pacman -S zsh zsh-completions
yay -S oh-my-zsh-git

echo "Installing graphic drivers"
sudo pacman -S xf86-video-intel intel-media-driver nvidia nvidia-settings nvidia-prime

echo "Installing xorg and lightdm"
sudo pacman -S xorg-server xorg-apps xdg-user-dirs lightdm lightdm-webkit2-greeter acpid
yay -S libinput-gestures
sudo systemctl enable acpid
libinput-gestures-setup autostart

echo "Installing bswpm and sxhkd"
sudo pacman -S bspwm sxhkd

echo "Installing audio"
sudo pacman -S alsa alsa-utils pulseaudio pulseaudio-alsa pulseaudio-bluetooth pavucontrol #lib32-libpulse lib32-alsa-plugins

echo "Installing applications"
sudo pacman -S firefox alacritty stow
yay -S vscodium-bin
