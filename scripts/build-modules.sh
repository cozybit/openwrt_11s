#! /bin/bash

MNTPOINT=`mktemp -d`
IMGFILE=openwrt/build_dir/linux-x86_generic/root.ext4
LOOPDEV=`sudo losetup -s -f $IMGFILE`

# mount openwrt's generated rootfs
sudo mount -t ext4 $LOOPDEV $MNTPOINT

# compile the modules and install there
cp config_files/kernel.dot.config openwrt/build_dir/linux-x86_generic/linux-*/.config
pushd openwrt/build_dir/linux-x86_generic/linux-*
ARCH=x86 make modules
sudo ARCH=x86 INSTALL_MOD_PATH=${MNTPOINT} make modules_install

# cleanup
sudo umount $MNTPOINT
sudo losetup -d $LOOPDEV
