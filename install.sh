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
paru -S rust vim neovim fastfetch google-chrome git zed btop steam gnome-keyring reflector noto-fonts-emoji nextcloud-client github-cli stow zoxide lazygit xdg-desktop-portal-gnome unzip obs-studio python-pip direnv samba xorg-xhost timeshift wireguard-tools openresolv zellij networkmanager-openvpn nm-connection-editor scrcpy dmidecode evolution docker docker-compose bat zen-browser-avx2-bin proton-pass vesktop xivlauncher spotify vintagestory fnm zsa-keymapp-bin input-remapper-git timeshift-autosnap signal-desktop cmatrix-git freerdp2 virtio-win dnsmasq qemu-full libvirt virt-install virt-manager virt-viewer edk2-ovmf swtpm qemu-img guestfs-tools libosinfo tuned

echo "Install bun"
curl -fsSL https://bun.sh/install | bash

echo "Update /etc/fstab"
sudo sed -i 's/,compress=zstd:3/,compress=lzo/' /etc/fstab
sudo mkdir -p /mnt/nvme /mnt/storage /mnt/ffxiv /mnt/data
sudo chown -R $(whoami):$(whoami) /mnt/nvme /mnt/data /mnt/ffxiv /mnt/storage
echo "# Ext4" | sudo tee -a /etc/fstab
echo "UUID=4c34bb71-a649-454b-8b66-b57f111108b9 /mnt/nvme ext4 defaults 0 0" | sudo tee -a /etc/fstab
echo "UUID=4a8ec68b-39b5-4a64-9dac-b3916f15f287 /mnt/ffxiv ext4 defaults 0 0" | sudo tee -a /etc/fstab
echo "UUID=fad6d483-9e02-4682-b670-d7ae2a2acda7 /mnt/data ext4 defaults 0 0" | sudo tee -a /etc/fstab
echo "UUID=fefe71de-8d0f-4589-b82e-8a7a81c1f40e /mnt/storage ext4 defaults 0 0" | sudo tee -a /etc/fstab

echo "Rename btrfs root label"
sudo btrfs filesystem label / "System"

echo "Ready to setup hyprdots ... Continue manually"
