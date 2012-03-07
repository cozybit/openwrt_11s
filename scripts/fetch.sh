#! /bin/bash

OPENWRT_VERSION=30831

[ `basename $PWD` == openwrt_11s ] || { echo This script must be executed from openwrt_11s root directory; exit -1; }

svn co -r${OPENWRT_VERSION} svn://svn.openwrt.org/openwrt/trunk openwrt
git clone git@github.com:cozybit/open80211s kernel
