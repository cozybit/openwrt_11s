#! /bin/bash

USER=`whoami`
IFNAME=`sudo tunctl -u $USER -b`
#TODO use root_check here
sudo /etc/qemu-ifup $IFNAME
qemu-system-i386 -nographic -kernel openwrt/trunk/build_dir/linux-x86_generic/bzImage -append "root=/dev/sda combined_mode=ide console=ttyS0" -net nic,model=e1000 -hda openwrt/trunk/build_dir/linux-x86_generic/root.ext4 -net tap,ifname=$IFNAME,script=no
tunctl -d $IFNAME

