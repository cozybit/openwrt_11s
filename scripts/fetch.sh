#! /bin/sh

set -x
mkdir openwrt_build
echo Wireless configuration copied!
cd openwrt_build
svn co svn://svn.openwrt.org/openwrt
cp ../config_files/.config trunk/
mkdir trunk/files
mkdir trunk/files/etc
mkdir trunk/files/etc/config
cp ../config_files/wireless trunk/files/etc/config
echo Wireless configuration copied!
sudo cp ../config_files/qemu-ifup /etc/qemu-ifup
echo Qemu Script Copied!
