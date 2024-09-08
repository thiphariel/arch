#!/usr/bin/env sh
virsh --connect qemu:///system shutdown win11 --mode acpi
pkill xfreerdp
