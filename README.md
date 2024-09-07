# Arch installation & Dotfiles

## Installation

Install minimal arch from official ISO, with git as additional package

## Dotfiles

Run `git clone https://github.com/thiphariel/arch`\
Run `install.sh` script\
```bash
git clone --depth 1 https://github.com/thiphariel/hyprdots ~/hyprdots
cd ~/hyprdots/Scripts
./install.sh
```
Copy the `private` folder from Nextcloud\
GNU Stow for dotfiles :
- `stow apps` for base apps conf
- `stow private` for git, ssh, aliases etc
- `stow hyprland` for hyprland
- `stow zsh` for zsh

> [!IMPORTANT]
> run `chmod -R 0600 $HOME/.ssh/` & `chmod 0644 $HOME/.ssh/*.pub $HOME/.ssh/config` to avoid ssh error

## Extras

```bash
# I have already no fucking idea of why I added that
sudo systemctl enable input-remapper
```
```bash
# Enable libvirt services (vm stuff)
for drv in qemu interface network nodedev nwfilter secret storage; do \
  sudo systemctl enable virt${drv}d.service; \
  sudo systemctl enable virt${drv}d{,-ro,-admin}.socket; \
done
```

## Games

Dotfiles for games are on a separate private repo :)

## For work

```bash
echo 'layout python' >> $HOME/lc/.envrc
cd $HOME/lc && direnv allow
```
```bash
wg-quick up $HOME/lc/vpn.conf
```

## To try
dust, tldr
