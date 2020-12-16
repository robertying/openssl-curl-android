#!/bin/bash

export NDK=$HOME/Library/Android/sdk/ndk/22.0.7026061
export HOST_TAG=darwin-x86_64
export MIN_SDK_VERSION=21

export CFLAGS="-Os -ffunction-sections -fdata-sections -fno-unwind-tables -fno-asynchronous-unwind-tables"
export LDFLAGS="-Wl,-s -Wl,-Bsymbolic -Wl,--gc-sections"

./build.sh
