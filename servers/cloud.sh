#!/bin/bash

sudo pacman -S --noconfirm caddy docker docker-compose fuse-overlayfs

echo "Enable docker"
sudo systemctl enable --now docker

echo "Edit ufw"
sudo ufw allow http
sudo ufw allow https
