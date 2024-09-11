#!/bin/bash

source functions.sh

ssh_port=$(get_required_input "What's the desired SSH port?")

echo "Enabling multilib repository"
sudo sed -i "/\[multilib\]/,/Include/"'s/^#//' /etc/pacman.conf
sudo pacman -Syu --noconfirm
sudo pacman -Fy
sudo pacman -S --noconfirm vim git zsh fzf zoxide base-devel fastfetch neovim bat eza lazygit
sudo sed -i "s/#Port 22/Port $ssh_port/" /etc/ssh/sshd_config
sudo sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin no/' /etc/ssh/sshd_config
sudo sed -i 's/#PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config
sudo systemctl restart sshd

git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
cd ..
rm -rf paru

echo "Setup ufw"
sudo pacman -S --noconfirm ufw
sudo systemctl enable ufw
sudo systemctl start ufw
sudo ufw allow $ssh_port/tcp
sudo ufw default deny incoming
sudo ufw default allow outgoing
