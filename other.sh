#!/bin/sh

# Useful packages
echo "[ARCHINIT] Installing useful packages..."
pacman -S flatpak noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra grub-customizer discord pacman-contrib thunderbird libnotify i2c-tools

# Install YAY AUR helper (Run as non-root user)
git clone https://aur.archlinux.org/yay.git
cd yay && makepkg -si && cd ..

# Install AUR packages
yay -S appimagelauncher
yay -S vscodium-bin

# OpenRGB & related kernel modules (Requires full PC reboot)
yay -S openrgb
modprobe i2c-dev
modprobe i2c-i801
echo i2c-dev > /etc/modules-load.d/i2c-dev.conf # (Necessary for INTEL only)
echo i2c-i801 > /etc/modules-load.d/i2c-i801.conf # (Necessary for INTEL only)
# modprobe i2c-piix4 # (Necessary for AMD only)
# echo i2c-piix4 > /etc/modules-load.d/i2c-piix4.conf # (Necessary for AMD only)
# Add profile from OpenRGB & edit openrgb.service
# nano /usr/lib/systemd/system/openrgb.service
# set: ExecStart=/usr/bin/openrgb -p /home/USER/.config/OpenRGB/PROFILE.orp
systemctl enable openrgb.service

#yay -S gnome-browser-connector # Only for GNOME installs!

# Flatpak utilities (Run as non-root user)
echo "[ARCHINIT] Installing useful flatpak packages..."
flatpak remote-add --user --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install flathub --user com.github.tchx84.Flatseal # Manage Flatpak apps permissions
flatpak install flathub --user org.gustavoperedo.FontDownloader # Font Downloader (Download and install fonts)
flatpak install flathub --user fr.romainvigier.MetadataCleaner # Metadata Cleaner (Deletes metadata from files)
flatpak install flathub --user org.polymc.PolyMC # PolyMC (FOSS fork of MultiMC, has better utilities and QOL improvements)
flatpak install flathub --user com.usebottles.bottles # Bottles (Run Windows software using wine)
#flatpak install flathub --user com.obsproject.Studio # OBS Studio (Not sure if i'll ever need it...but whatever)
#flatpak install --from https://flathub.org/repo/appstream/org.kicad.KiCad.flatpakref --user # KiCad (FOSS PCB design software)
flatpak install --from https://flathub.org/repo/appstream/org.libreoffice.LibreOffice.flatpakref --user # Office suite
flatpak install flathub --user org.gnome.World.PikaBackup # Backup solution (home partition only)

# Set default file manager for apps (check /home/USER/.config/mimeapps.list)
xdg-mime default org.gnome.Nautilus.desktop inode/directory # (GNOME only)
# xdg-mime default Dolphin.desktop inode/directory # (KDE only)

# WAYDROID (AUR)
# Notes: https://wiki.archlinux.org/title/Waydroid

# piper (pacman) for gaming mouse configuration

# Virtualization
#echo "[ARCHINIT] Installing virtualization packages..."
#pacman -S libvirtd virt-manager qemu qemu-arch-extra

# GENERAL STUFF
# For CUPS printing drivers see: https://wiki.archlinux.org/title/CUPS/Printer-specific_problems
#pacman -S hplip # HP Printiung utility (Only if HP printers are present in the network)
