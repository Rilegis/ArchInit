#!/bin/sh
##########################
#    SCRIPT VARIABLES    #
##########################
# Timezone
TZ_ZONE=""
TZ_CITY=""
# Keymap
K_KEYMAP=""
# Hostname
H_HOST=""
# User
U_USERNAME=""
# Disk partitions
P_EFI=""
# Drivers
D_DRIVERS="" # ACCEPTS: INTEL, NVIDIA, AMD, VMWARE

# Set timezone
ln -sf /usr/share/zoneinfo/$TZ_ZONE/$TZ_CITY /etc/localtime
hwclock --systohc # Generates '/etc/adjtime'

# Locales generation
rm /etc/locale.gen # Prevents duplicate entries in case of multiple execution of the script
echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
echo "en_GB.UTF-8 UTF-8" >> /etc/locale.gen
echo "it_IT.UTF-8 UTF-8" >> /etc/locale.gen
locale-gen
rm /etc/locale.conf # Prevents duplicate entries in case of multiple execution of the script
echo "LANG=en_US.UTF-8" >> /etc/locale.conf
rm /etc/vconsole.conf # Prevents duplicate entries in case of multiple execution of the script
echo "KEYMAP=$K_KEYMAP" >> /etc/vconsole.conf

# Set hostnames
rm /etc/hostname # Prevents duplicate entries in case of multiple execution of the script
echo $H_HOST >> /etc/hostname
rm /etc/hosts # Prevents duplicate entries in case of multiple execution of the script
echo "127.0.0.1 localhost" >> /etc/hosts
echo "::1       localhost" >> /etc/hosts
echo "127.0.1.1 $H_HOST.localdomain $H_HOST" >> /etc/hosts

# Add new user
useradd -m $U_USERNAME
usermod -aG wheel,audio,video,sys,uucp,storage,disk,floppy,optical,scanner $U_USERNAME

# Set users password
echo "[ARCHINIT] You are now asked to type your new 'root' user password..."
passwd
echo "[ARCHINIT] You are now asked to type your new '$U_USERNAME' user password..."
passwd $U_USERNAME

# Uncomment '%wheel' group for sudo privileges
echo "[ARCHINIT] Uncomment the following line to permit sudo access to wheel users:"
echo "[ARCHINIT] '%wheel ALL=(ALL:ALL) ALL'"
read -p "[ARCHINIT] Press enter to edit..."
EDITOR=nano visudo

# Bootloader installation
echo "[ARCHINIT] Installing GRUB bootloader..."
pacman -S grub efibootmgr dosfstools os-prober mtools
mkdir /boot/EFI
mount /dev/$P_EFI /boot/EFI
grub-install --target=x86_64-efi --bootloader-id=grub_uefi --recheck
grub-mkconfig -o /boot/grub/grub.cfg

# Base packages installation
echo "[ARCHINIT] Installing base packages..."
pacman -S ntp acpid acpi acpi_call dbus cups ntfs-3g networkmanager base-devel nfs-utils archlinux-keyring
systemctl enable NetworkManager
systemctl enable ntpd
systemctl enable acpid
systemctl enable cups
usermod -aG lp $U_USERNAME # Add user to 'lp' group, needed for managing CUPS printers

# Pipewire
echo "[ARCHINIT] Installing pipewire..."
pacman -S pipewire pipewire-pulse pipewire-alsa pipewire-jack wireplumber

# W.I.P - Audio and video codecs
#pacman -S vlc alsa-utils pavucontrol

# Utilities
echo "[ARCHINIT] Installing utilities packages..."
pacman -S htop
# Drivers
echo "[ARCHINIT] Installing $D_DRIVERS drivers..."
if [ $D_DRIVERS = "INTEL" ]; then # INTEL drivers
    pacman -S mesa vulkan-intel
elif [ $D_DRIVERS = "NVIDIA" ]; then # NVIDIA drivers and utilities
    pacman -S nvidia nvidia-utils nvidia-settings
elif [ $D_DRIVERS = "AMD" ]; then # AMD GPU drivers and utilities
    pacman -S xf86-video-amdgpu
elif [ $D_DRIVERS = "VMWARE" ]; then # VMWARE drivers
    pacman -S open-vm-tools xf86-input-vmmouse xf86-video-vmware mesa gtk2 gtkmm
    rm /etc/X11/Xwrapper.config # Prevents duplicate entries in case of multiple execution of the script
    echo "needs_root_rights=yes" >> /etc/X11/Xwrapper.config
    systemctl enable --now vmtoolsd
else
    echo "[ARCHINIT] No video driver selected..."
fi

# Check NTP sync
ntpd -gq

# Exit installation environment
echo "[ARCHINIT] Base system installation completed!"
echo "[ARCHINIT] You are about to leave the installation environment, don't forget to unmount the installation environment using 'umount -R /mnt' (or 'umount -l /mnt') and reboot your system."
read -p "[ARCHINIT] Press enter to exit..."
exit
#umount -R /mnt (or 'umount -l /mnt')
#reboot 0
