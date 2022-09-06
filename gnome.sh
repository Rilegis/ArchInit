#!/bin/sh

# Update repos
echo "[ARCHINIT] Updating repositories..."
pacman -Syu

# GNOME base installation (Includes Wayland compositor)
echo "[ARCHINIT] Installing minimal GNOME setup..."
pacman -S gnome-shell nautilus gnome-terminal gnome-software gnome-software-packagekit-plugin gnome-control-center gnome-disk-utility gnome-menus gnome-calculator gnome-screenshot gnome-user-share xdg-user-dirs-gtk xdg-desktop-portal-gnome gnome-keyring gdm

# GNOME utilities installation
echo "[ARCHINIT] Installing gnome utilities..."
pacman -S gnome-tweak-tool gnome-backgrounds gnome-themes-extra gnome-shell-extensions gnome-remote-desktop gnome-connections network-manager-applet gnome-characters

# Enable GDM service
echo "[ARCHINIT] Enabling GDM service..."
systemctl enable --now gdm
