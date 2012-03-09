#! /bin/sh

cp config_files/kernel.dot.config openwrt/build_dir/linux-x86_generic/linux-*/.config
pushd openwrt/build_dir/linux-x86_generic/linux-*
ARCH=x86 make modules
ARCH=x86 INSTALL_MOD_PATH=/home/javier/dev/openwrt_11s/openwrt/build_dir/target-i386_uClibc-0.9.33/root-x86 make modules_install
popd
cd openwrt
make target/install
