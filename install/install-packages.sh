#!/bin/bash
set -e -o pipefail -x

echo "Install zsh"
sudo pacman -S zsh zsh-completions
yay -S oh-my-zsh-git

echo "Installing graphic drivers"
sudo pacman -S xf86-video-intel intel-media-driver nvidia nvidia-settings nvidia-prime

echo "Installing xorg and lightdm"
sudo pacman -S xorg-server xorg-apps xdg-user-dirs lightdm lightdm-webkit2-greeter

echo "Installing bswpm and sxhkd"
sudo pacman -S bswpm sxhkd

echo "Installing applications"
sudo pacman -S firefox alacritty stow
yay -S vscodium-bin