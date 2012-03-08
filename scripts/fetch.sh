#! /bin/bash

[ `basename $PWD` == openwrt_11s ] || { echo This script must be executed from openwrt_11s root directory; exit -1; }

# TODO: use git for openwrt as well
git clone git://nbd.name/openwrt.git
git clone git@github.com:cozybit/open80211s kernel
