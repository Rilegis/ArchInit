#!/bin/sh

# Useful packages
echo "[ARCHINIT] Installing useful packages..."
pacman -S noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra grub-customizer discord pacman-contrib thunderbird libnotify i2c-tools

# Kernel modules for OpenRGB (see run-non-root.sh); Requires full PC reboot.
modprobe i2c-dev
modprobe i2c-i801
echo i2c-dev > /etc/modules-load.d/i2c-dev.conf # (Necessary for INTEL only)
echo i2c-i801 > /etc/modules-load.d/i2c-i801.conf # (Necessary for INTEL only)
# modprobe i2c-piix4 # (Necessary for AMD only)
# echo i2c-piix4 > /etc/modules-load.d/i2c-piix4.conf # (Necessary for AMD only)

# WAYDROID (AUR)
# Notes: https://wiki.archlinux.org/title/Waydroid

# piper (pacman) for gaming mouse configuration

# Virtualization
#echo "[ARCHINIT] Installing virtualization packages..."
#pacman -S libvirtd virt-manager qemu qemu-arch-extra

# GENERAL STUFF
# For CUPS printing drivers see: https://wiki.archlinux.org/title/CUPS/Printer-specific_problems
#pacman -S hplip # HP Printiung utility (Only if HP printers are present in the network)
