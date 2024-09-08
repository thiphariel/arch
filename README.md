# Arch installation & Dotfiles

## Installation

Install minimal arch from official ISO, with git as additional package

## Dotfiles

Run `git clone https://github.com/thiphariel/arch`\
Run `install.sh` script
```bash
git clone --depth 1 https://github.com/thiphariel/hyprdots ~/hyprdots
cd ~/hyprdots/Scripts
./install.sh
```
> [!CAUTION]
> Known issue with the second nvidia GPU. The script is trying to override updated nvidia-utils with the old one.\
> To fix it, edit the `add nvidia drivers to the list` part on the hyperdots `install.sh`

Copy the `private` folder from Nextcloud\
GNU Stow for dotfiles :
- `stow apps` for base apps conf
- `stow private` for git, ssh, aliases etc
- `stow hyprland` for hyprland
- `stow zsh` for zsh

> [!IMPORTANT]
> run the following :\
> `chmod -R 0700 arch/private/.ssh`\
> `chmod -R 0600 arch/private/.ssh/*`\
> `chmod 0644 arch/private/.ssh/*.pub arch/private/.ssh/config`\
> to avoid ssh error

## Extras

```bash
# I have already no fucking idea of why I added that
sudo systemctl enable input-remapper
```

## VM

See [vm.md](vm.md)

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
