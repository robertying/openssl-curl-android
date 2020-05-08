#!/bin/bash

export ANDROID_NDK_HOME=$HOME/Library/Android/sdk/ndk/21.1.6352462
export HOST_TAG=darwin-x86_64
export MIN_SDK_VERSION=21

export CFLAGS="-Os -ffunction-sections -fdata-sections -fno-unwind-tables -fno-asynchronous-unwind-tables"
export LDFLAGS="-Wl,-s -Wl,-Bsymbolic -Wl,--gc-sections"

./build.sh
