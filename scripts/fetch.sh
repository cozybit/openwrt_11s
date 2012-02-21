#! /bin/sh

set -x
BUILDROOT=openwrt_11s/op
ROOT_UID=0	#Only users with root privilege can access the script

if [ "$UID" -ne "$ROOT_UID" ]
then
  echo "Must be root to run this script."
  exit $E_NOTROOT
fi  
svn co svn://svn.openwrt.org/openwrt

cp openwrt_11s/config_files/.config openwrt/trunk/

mkdir openwrt/trunk/files
mkdir openwrt/trunk/files/etc
mkdir openwrt/trunk/files/etc/config

cp openwrt_11s/config_files/wireless openwrt/trunk/files/etc/config/

sudo cp openwrt_11s/config_files/qemu-ifup /etc/qemu-ifup
