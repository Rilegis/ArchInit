#!/bin/sh

# Update repos
echo "[ARCHINIT] Updating repositories..."
pacman -Syu

# GNOME base installation
echo "[ARCHINIT] Installing minimal GNOME setup..."
pacman -S gnome-shell \
    nautilus \
    gnome-terminal \
    gnome-software \
    gnome-software-packagekit-plugin \
    gnome-control-center \
    gnome-disk-utility \
    gnome-menus \
    eog \
    gnome-calculator \
    gnome-screenshot \
    gnome-user-share \
    xdg-user-dirs-gtk \
    xdg-desktop-portal-gnome \
    gnome-keyring \
    gdm

# GNOME utilities installation
echo "[ARCHINIT] Installing gnome utilities..."
pacman -S gnome-bluetooth-3.0 \
    gnome-tweak-tool \
    gnome-backgrounds \
    gnome-themes-extra \
    gnome-shell-extensions \
    gnome-remote-desktop \
    gnome-connections \
    network-manager-applet \
    gnome-characters \
    gnome-keyring \
    dconf-editor \
    seahorse

# Set default file manager for apps (check /home/USER/.config/mimeapps.list)
xdg-mime default org.gnome.Nautilus.desktop inode/directory

# Other stuff...
flatpak install flathub --user com.mattjakeman.ExtensionManager # Extension manager app for GNOME

# Enable GDM service
echo "[ARCHINIT] Enabling GDM service..."
systemctl enable --now gdm
