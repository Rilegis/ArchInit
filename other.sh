#!/bin/sh

# Useful packages
echo "[ARCHINIT] Installing useful packages..."
pacman -S flatpak noto-fonts-emoji rsync

# Flatpak utilities
echo "[ARCHINIT] Installing useful flatpak packages..."
flatpak install flathub org.gustavoperedo.FontDownloader # Font Downloader (Download and install fonts)
flatpak install flathub fr.romainvigier.MetadataCleaner # Metadata Cleaner (Deletes metadata from files)
flatpak install flathub org.polymc.PolyMC # PolyMC (FOSS fork of MultiMC, has better utilities and QOL improvements)
#flatpak install flathub com.obsproject.Studio # OBS Studio (Not sure if i'll ever need it...but whatever)
flatpak install --from https://flathub.org/repo/appstream/org.kicad.KiCad.flatpakref # KiCad (FOSS PCB design software)

# Other utilities
# piper (pacman) for gaming mouse configuration
# openrgb (appimage) for rgb control
# waydroid (aur) to run android apps on linux

# Virtualization
#echo "[ARCHINIT] Installing virtualization packages..."
#pacman -S libvirtd virt-manager qemu qemu-arch-extra