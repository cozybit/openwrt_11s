#! /bin/sh

set -x
svn co svn://svn.openwrt.org/openwrt

cp openwrt_11s/config_files/.config openwrt/trunk/

mkdir openwrt/trunk/files
mkdir openwrt/trunk/files/etc
mkdir openwrt/trunk/files/etc/config

cp openwrt_11s/config_files/wireless openwrt/trunk/files/etc/config/

sudo cp openwrt_11s/config_files/qemu-ifup /etc/qemu-ifup
