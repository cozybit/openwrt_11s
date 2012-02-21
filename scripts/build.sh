#! /bin/bash

cd openwrt_11s/openwrt/trunk
./scripts/feeds update -a
make
