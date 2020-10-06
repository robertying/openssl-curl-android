#!/bin/bash

export TOOLCHAIN=$ANDROID_NDK_HOME/toolchains/llvm/prebuilt/$HOST_TAG
PATH=$TOOLCHAIN/bin:$PATH

mkdir -p build/openssl
cd openssl

# arm64
export TARGET_HOST=aarch64-linux-android
export ANDROID_ARCH=arm64-v8a

./Configure android-arm64 no-shared \
 -D__ANDROID_API__=$MIN_SDK_VERSION \
 --prefix=$PWD/build/$ANDROID_ARCH

make -j5
make install_sw
make clean
mkdir -p ../build/openssl/$ANDROID_ARCH
cp -R $PWD/build/$ANDROID_ARCH ../build/openssl/

# arm
export TARGET_HOST=armv7a-linux-androideabi
export ANDROID_ARCH=armeabi-v7a

./Configure android-arm no-shared \
 -D__ANDROID_API__=$MIN_SDK_VERSION \
 --prefix=$PWD/build/$ANDROID_ARCH

make -j5
make install_sw
make clean
mkdir -p ../build/openssl/$ANDROID_ARCH
cp -R $PWD/build/$ANDROID_ARCH ../build/openssl/

# x86
export TARGET_HOST=i686-linux-android
export ANDROID_ARCH=x86

./Configure android-x86 no-shared \
 -D__ANDROID_API__=$MIN_SDK_VERSION \
 --prefix=$PWD/build/$ANDROID_ARCH

make -j5
make install_sw
make clean
mkdir -p ../build/openssl/$ANDROID_ARCH
cp -R $PWD/build/$ANDROID_ARCH ../build/openssl/

# x64
export TARGET_HOST=x86_64-linux-android
export ANDROID_ARCH=x86_64

./Configure android-x86_64 no-shared \
 -D__ANDROID_API__=$MIN_SDK_VERSION \
 --prefix=$PWD/build/$ANDROID_ARCH

make -j5
make install_sw
make clean
mkdir -p ../build/openssl/$ANDROID_ARCH
cp -R $PWD/build/$ANDROID_ARCH ../build/openssl/

cd ..
