#!/bin/sh

# Useful packages
echo "[ARCHINIT] Installing useful packages..."
pacman -S flatpak noto-fonts-emoji kicad rsync obs-studio
# TBD switch 'obs-studio' to flatpak

# Virtualization
echo "[ARCHINIT] Installing virtualization packages..."
pacman -S libvirtd virt-manager qemu qemu-arch-extra