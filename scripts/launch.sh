#! /bin/bash

USER=`whoami`
IFNAME=`sudo tunctl -u $USER -b`
#TODO use root_check here
sudo /etc/qemu-ifup $IFNAME
qemu-system-i386 -nographic -kernel openwrt/build_dir/linux-x86_generic/bzImage \
	-hda openwrt/build_dir/linux-x86_generic/root.ext4 \
	-append "root=/dev/sda combined_mode=ide console=ttyS0 init=/etc/preinit" \
	-device e1000,netdev=lan0 \
	-netdev tap,id=lan0,ifname=$IFNAME,script=no \
	-enable-kvm -smp 2
tunctl -d $IFNAME
