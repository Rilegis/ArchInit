#!/bin/sh

# Useful packages
echo "[ARCHINIT] Installing useful packages..."
pacman -S flatpak noto-fonts-emoji kicad rsync obs-studio
# TBD switch 'obs-studio' to flatpak

# Other utilities
# piper (pacman) for gaming mouse configuration
# openrgb (appimage) for rgb control
# polymc/gdlauncher (flatpak) for MC
# waydroid (aur) to run android apps on linux
# kicad (pacman or flatpak) for pcb design

# Virtualization
echo "[ARCHINIT] Installing virtualization packages..."
pacman -S libvirtd virt-manager qemu qemu-arch-extra
