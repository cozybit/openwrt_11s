#! /bin/bash

OPENWRT_COMMIT=d118a7af950c6dbc364cf5c7d02cc139e6d3413c

[ `basename $PWD` == openwrt_11s ] || { echo This script must be executed from openwrt_11s root directory; exit -1; }

[ -d openwrt ] || { git clone git://nbd.name/openwrt.git --no-checkout || fail "ERROR: git clone failed. Aborting. "; }
pushd openwrt
git fetch
git checkout ${OPENWRT_COMMIT} || fail "ERROR: git checkout failed. Aborting."

# apply patches
git am ../patches/* || fail "ERROR: patches werent able to apply cleanly. Aborting."

# Clean out the feeds so we get the right rev on feeds update
./scripts/feeds clean

./scripts/feeds update
./scripts/feeds install -a

popd > /dev/null
