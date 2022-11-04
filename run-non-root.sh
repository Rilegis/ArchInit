#!/bin/sh

# NOTE TO SELF: DO NOT RUN AS root YA DUMMY

# Install YAY AUR helper (Run as non-root user)
git clone https://aur.archlinux.org/yay.git
cd yay && makepkg -si && cd ..

# Install AUR packages (Run as non-root user)
yay -S appimagelauncher
yay -S vscodium-bin
yay -S openrgb
# Add profile from OpenRGB & edit openrgb.service
# nano /usr/lib/systemd/system/openrgb.service
# set: ExecStart=/usr/bin/openrgb -p /home/USER/.config/OpenRGB/PROFILE.orp
systemctl enable openrgb.service

# Install flatpak package from regular repo (Run as non-root user)
yay -s flatpak

# Flatpak utilities (Run as non-root user)
echo "[ARCHINIT] Installing useful flatpak packages..."
flatpak remote-add --user --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install flathub --user com.github.tchx84.Flatseal # Manage Flatpak apps permissions
flatpak install flathub --user org.gustavoperedo.FontDownloader # Font Downloader (Download and install fonts)
flatpak install flathub --user fr.romainvigier.MetadataCleaner # Metadata Cleaner (Deletes metadata from files)
flatpak install flathub --user com.usebottles.bottles # Bottles (Run Windows software using wine)
#flatpak install flathub --user com.obsproject.Studio # OBS Studio (Not sure if i'll ever need it...but whatever)
#flatpak install --from https://flathub.org/repo/appstream/org.kicad.KiCad.flatpakref --user # KiCad (FOSS PCB design software)
flatpak install --from https://flathub.org/repo/appstream/org.libreoffice.LibreOffice.flatpakref --user # Office suite
flatpak install flathub --user org.gnome.World.PikaBackup # Backup solution (home partition only)