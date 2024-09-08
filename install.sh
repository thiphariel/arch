#!/bin/bash

echo "Install reflector and run it"
sudo pacman -S --noconfirm reflector
sudo reflector --country France --latest 20 --protocol http --protocol https --sort rate --save /etc/pacman.d/mirrorlist

echo "Install base dependencies"
sudo pacman -S --noconfirm git base-devel

echo "Paru installation"
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si --noconfirm
cd ..
rm -rf paru

echo "Install all dependencies"
paru -S rust ntfs-3g vim neovim fastfetch git zed btop steam gnome-keyring reflector noto-fonts-emoji nextcloud-client github-cli stow zoxide lazygit xdg-desktop-portal-gnome unzip obs-studio python-pip direnv samba xorg-xhost timeshift wireguard-tools openresolv zellij networkmanager-openvpn nm-connection-editor scrcpy dmidecode evolution docker docker-compose bat zen-browser-avx2-bin proton-pass vesktop xivlauncher spotify vintagestory fnm zsa-keymapp-bin input-remapper-git timeshift-autosnap signal-desktop cmatrix-git freerdp2 virtio-win dnsmasq qemu-full libvirt virt-install virt-manager virt-viewer edk2-ovmf swtpm qemu-img guestfs-tools libosinfo tuned

echo "Install bun"
curl -fsSL https://bun.sh/install | bash

echo "Update /etc/fstab"
sudo sed -i 's/,compress=zstd:3/,compress=lzo/' /etc/fstab
sudo mkdir -p /mnt/storage /mnt/ffxiv /mnt/data
echo "# NTFS disks" | sudo tee -a /etc/fstab
echo "UUID=68240E5E240E301C	/mnt/storage ntfs defaults 0 0" | sudo tee -a /etc/fstab
echo "UUID=40BAC66CBAC65E52	/mnt/ffxiv ntfs defaults 0 0" | sudo tee -a /etc/fstab
echo "UUID=5A66509F66507E27	/mnt/data ntfs defaults 0 0" | sudo tee -a /etc/fstab

echo "Ready to setup hyprdots ... Continue manually"
