#! /bin/bash

[ `basename $PWD` == openwrt_11s ] || { echo This script must be executed from openwrt_11s root directory; exit -1; }

svn co svn://svn.openwrt.org/openwrt/trunk openwrt
git clone git@github.com:cozybit/open80211s kernel
