# Personal Arch Linux configuration

## Grub
To save grub config : ```sudo grub-mkconfig -o /boot/grub/grub.cfg```

## Themes
- GTK Theme : Arc-Dark https://github.com/horst3180/arc-theme
- Icon Theme : Arc Icon https://github.com/horst3180/arc-icon-theme
- Cursors : Capitain-cursors https://github.com/keeferrourke/capitaine-cursors
- Font : Roboto

## Shell
Zsh (.zshrc provided)

## Printer (Canon IP7250)
- Install cups
- Run & enable CUPS service ```systemctl start org.cups.cupsd.service && systemctl enable org.cups.cupsd.service```
- Run & enable Avahi service (for network scanning only) ```systemctl start avahi-daemon.service && systemctl enable avahi-daemon.service```
- Add current user to ```sys``` group ```usermod -aG sys thiphariel```
- Add printer through the web interface at http://localhost:631
- Test print & remove ```sys``` group on the current user ! ```sudo gpasswd -d thiphariel sys```

## Apps
- screenfetch
- android-studio
- capitaines-cursors
- discord
- google-chrome
- spotify
- gnome-shell-extension-gmail-message-tray-git
