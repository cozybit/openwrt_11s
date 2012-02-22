#! /bin/bash

[ `basename $PWD` == openwrt_11s ] || { echo This script must be executed from openwrt_11s root directory; exit -1; }
cp config_files/dot.config openwrt/.config
cd openwrt
make
