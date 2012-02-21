#! /bin/bash

set -x
cd openwrt/trunk
make defconfig
cp openwrt_11s/config_files/.config openwrt/trunk/
make
