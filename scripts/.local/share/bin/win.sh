#!/usr/bin/env sh
virsh --connect qemu:///system start win11
sleep 3
xfreerdp -grab-keyboard /v:192.168.122.73 /u:thiph /p:thiph /size:100% /d: /dynamic-resolution /gfx-h264:avc444 +gfx-progressive &
