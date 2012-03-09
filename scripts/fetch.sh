#! /bin/bash

OPENWRT_COMMIT=d118a7af950c6dbc364cf5c7d02cc139e6d3413c

[ `basename $PWD` == openwrt_11s ] || { echo This script must be executed from openwrt_11s root directory; exit -1; }

# TODO: use git for openwrt as well
git clone git://nbd.name/openwrt.git --no-checkout
cd openwrt; git checkout ${OPENWRT_COMMIT}; cd ..
git clone git@github.com:cozybit/open80211s kernel
