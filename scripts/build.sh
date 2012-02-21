#! /bin/bash

cd ~/openwrt_build/openwrt/trunk
./scripts/feeds update -a
make
