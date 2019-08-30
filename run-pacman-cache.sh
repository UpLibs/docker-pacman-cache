#!/bin/bash -x

echo 'Server = '$1 > /etc/pacman.d/mirrorlist
echo 'nameserver 8.8.8.8' >> /etc/resolv.conf
echo 'nameserver 8.8.4.4' >> /etc/resolv.conf

echo "------------------------------------------------------------------"
cat /etc/pacman.d/mirrorlist
echo "------------------------------------------------------------------"

rm -f /tmp/upp-linux-build/upp-pacman-cache/cache/*
rm -f /tmp/upp-linux-build/upp-pacman-cache/sync/*.db
rm -f /var/lib/pacman/sync/*.db

/usr/bin/pacman -v --cachedir /tmp/upp-linux-build/upp-pacman-cache/cache --config /tmp/pacman.conf --noconfirm -Syw \
binutils zip unzip bzip2 xz tree nano wget traceroute v4l-utils python v4l-utils \
git zlib autoconf automake libtool gcc make ntp \
dhcpcd wpa_supplicant iw

cp -f /var/lib/pacman/sync/* /tmp/upp-linux-build/upp-pacman-cache/sync
