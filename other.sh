#!/bin/sh

# Useful packages
echo "[ARCHINIT] Installing useful packages..."
pacman -S flatpak noto-fonts-emoji rsync grub-customizer

# Install AUR helper (yay)
git clone https://aur.archlinux.org/yay.git
cd yay && makepkg -si && cd ..

# Install AUR packages
yay -S appimagelauncher
yay -S vscodium-git
#yay -S gnome-browser-connector # Only for GNOME installs!

# Flatpak utilities
echo "[ARCHINIT] Installing useful flatpak packages..."
flatpak remote-add --user --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install flathub --user org.gustavoperedo.FontDownloader # Font Downloader (Download and install fonts)
flatpak install flathub --user fr.romainvigier.MetadataCleaner # Metadata Cleaner (Deletes metadata from files)
flatpak install flathub --user org.polymc.PolyMC # PolyMC (FOSS fork of MultiMC, has better utilities and QOL improvements)
flatpak install flathub --user com.usebottles.bottles # Bottles (Run Windows software using wine)
#flatpak install flathub --user com.obsproject.Studio # OBS Studio (Not sure if i'll ever need it...but whatever)
#flatpak install --from https://flathub.org/repo/appstream/org.kicad.KiCad.flatpakref --user # KiCad (FOSS PCB design software)
flatpak install --from https://flathub.org/repo/appstream/org.libreoffice.LibreOffice.flatpakref --user # Office suite

# Other utilities
# piper (pacman) for gaming mouse configuration
# openrgb (appimage) for rgb control
# waydroid (aur) to run android apps on linux

# Virtualization
#echo "[ARCHINIT] Installing virtualization packages..."
#pacman -S libvirtd virt-manager qemu qemu-arch-extra
