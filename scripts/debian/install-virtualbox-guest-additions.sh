#!/bin/sh
# Install VirtualBox Guest Additions without any user interaction. Doesn't
# require actions from the host (typically, add the VBoxGuestAdditions CDROM).

# Uninstall Debian's virtualbox-ose.
aptitude purge --assume-yes virtualbox-ose-guest-dkms virtualbox-ose-guest-utils virtualbox-ose-guest-x11

# VirtualBox Guest Additions requirements.
aptitude install --without-recommends --assume-yes dkms build-essential linux-headers-`uname -r`;

# Get VBoxGuestAdditions iso. We do it with a trick:
# 1. First install VirtualBox locally.
sh -c "echo 'deb http://download.virtualbox.org/virtualbox/debian squeeze contrib non-free' > /etc/apt/sources.list.d/virtualbox.list";
wget http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc;
sh -c "test '`md5sum oracle_vbox.asc`' = 'f8474c56986af443f43a735e41d58a29  oracle_vbox.asc' || exit 123";
apt-key add oracle_vbox.asc;
rm oracle_vbox.asc;
aptitude update;
aptitude install --without-recommends --assume-yes virtualbox-4.1;
# 2. Save the VBoxGuestAddition iso file.
cp /usr/share/virtualbox/VBoxGuestAdditions.iso ./;
# 3. Now we no longer need VirtualBox itself, so uninstall it.
aptitude purge --assume-yes virtualbox-4.1;

# Mount the iso file.
modprobe loop;
mkdir /mnt/vboxguestadditions;
mount -t iso9660 -o loop ./VBoxGuestAdditions.iso /mnt/vboxguestadditions;

# Actually install VirtualBox Guest Additions.
/mnt/vboxguestadditions/VBoxLinuxAdditions.run;

# Cleanup.
umount /mnt/vboxguestadditions;
rm -r /mnt/vboxguestadditions;
rm VBoxGuestAdditions.iso;
