#!/bin/bash
cd ~/rom

. build/envsetup.sh
export CCACHE_DIR=~/ccache
export CCACHE_EXEC=$(which ccache)
export USE_CCACHE=1
ccache -M 20G -F 0
export BUILD_USERNAME="darknius"
export BUILD_HOSTNAME="darx"
$lunch
mka api-stubs-docs
mka hiddenapi-lists-docs
mka system-api-stubs-docs
mka test-api-stubs-docs
mka kronic
breakfast juice
$make -j8 &
sleep 100m
kill %1
ccache -s
