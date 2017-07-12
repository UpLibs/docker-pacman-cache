#!/bin/bash -x

cp -f /tmp/upp-linux-build/upp-pacman-cache/mirrorlist /etc/pacman.d/mirrorlist

echo "------------------------------------------------------------------"
cat /tmp/upp-linux-build/upp-pacman-cache/pacman.conf
echo "------------------------------------------------------------------"
cat /etc/pacman.d/mirrorlist
echo "------------------------------------------------------------------"

rm -f /tmp/upp-linux-build/upp-pacman-cache/cache/*

rm -f /tmp/upp-linux-build/upp-pacman-cache/sync/*.db
rm -f /var/lib/pacman/sync/*.db

/usr/bin/pacman --cachedir /tmp/upp-linux-build/upp-pacman-cache/cache --config /tmp/upp-linux-build/upp-pacman-cache/pacman.conf --noconfirm -Syw \
binutils zip unzip bzip2 xz tree nano wget traceroute v4l-utils python v4l-utils \
git zlib autoconf automake libtool gcc make ntp \
dhcpcd wpa_supplicant iw

cp -f /var/lib/pacman/sync/* /tmp/upp-linux-build/upp-pacman-cache/sync