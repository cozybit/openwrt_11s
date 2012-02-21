#! /bin/sh

set -x
svn co svn://svn.openwrt.org/openwrt

cp openwrt_11s/config_files/.config openwrt_11s/openwrt/trunk/

mkdir openwrt_11s/openwrt/trunk/files
mkdir openwrt_11s/openwrt/trunk/files/etc
mkdir openwrt_11s/openwrt/trunk/files/etc/config

cp openwrt_11s/config_files/wireless openwrt_11s/openwrt/trunk/files/etc/config/

sudo cp ../config_files/qemu-ifup /etc/qemu-ifup
