#!/bin/bash

export NDK=$HOME/Library/Android/sdk/ndk/23.0.7599858
export HOST_TAG=darwin-x86_64
export MIN_SDK_VERSION=23

export CFLAGS="-Os"
export LDFLAGS="-Wl,-Bsymbolic"

./build.sh
