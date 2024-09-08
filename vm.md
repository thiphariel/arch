```bash
# Enable libvirt services (vm stuff)
for drv in qemu interface network nodedev nwfilter secret storage; do \
  sudo systemctl enable virt${drv}d.service; \
  sudo systemctl enable virt${drv}d{,-ro,-admin}.socket; \
done
```

```bash
sudo virt-host-validate qemu
```
> [!NOTE]
> QEMU: Checking for secure guest support on WARN is no big deal on Intel

Enable vt-d on kernel
```bash
sudo vim /etc/default/grub
```
Add `intel_iommu=on iommu=pt` on `GRUB_CMDLINE_LINUX`\
Regenerate the grub conf `sudo grub-mkconfig -o /boot/grub/grub.cfg`\
Reboot and revalidate the host `sudo virt-host-validate qemu`\
Start and enable `tuned` service `sudo systemctl enable --now tuned`\
Change the profile to `virtual-host` `sudo tuned-adm profile virtual-host`\
Verify that everything is fine `sudo tuned-adm verify`\
Start the default network `sudo virsh net-start default`\
Autostart the default network `sudo virsh net-autostart default`\
Add the user to the `libvirt` group `sudo usermod -aG libvirt $(whoami)`\
Add the LIBVIRT URI to the environment `echo "export LIBVIRT_DEFAULT_URI=qemu:///system" >> ~/.zshrc`\
Reload the shell `source ~/.zshrc`\
Set facl to libvirt/images to the user :\
`sudo setfacl -R -b /var/lib/libvirt/images/`\
`sudo setfacl -R -m u:$(whoami):rwx /var/lib/libvirt/images/`\
`sudo setfacl -m d:u:$(whoami):rwx /var/lib/libvirt/images/`\

Windows : https://www.youtube.com/watch?v=7tqKBy9r9b4
