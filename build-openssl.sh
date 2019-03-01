#!/bin/bash

mkdir -p build/openssl
cd openssl

export TOOLCHAIN=$ANDROID_NDK_HOME/toolchains/llvm/prebuilt/$HOST_TAG
PATH=$TOOLCHAIN/bin:$PATH

# arm64
export TARGET_HOST=aarch64-linux-android
./Configure android-arm64 no-shared \
 -D__ANDROID_API__=$MIN_SDK_VERSION \
 --prefix=$PWD/build/arm64-v8a

make -j4
make install_sw
make clean
mkdir -p ../build/openssl/arm64-v8a
cp $PWD/build/arm64-v8a/lib/*.a ../build/openssl/arm64-v8a

# arm
export TARGET_HOST=armv7a-linux-androideabi
./Configure android-arm no-shared \
 -D__ANDROID_API__=$MIN_SDK_VERSION \
 --prefix=$PWD/build/armeabi-v7a

make -j4
make install_sw
make clean
mkdir -p ../build/openssl/armeabi-v7a
cp $PWD/build/armeabi-v7a/lib/*.a ../build/openssl/armeabi-v7a

# x86
export TARGET_HOST=i686-linux-android
./Configure android-x86 no-shared \
 -D__ANDROID_API__=$MIN_SDK_VERSION \
 --prefix=$PWD/build/x86

make -j4
make install_sw
make clean
mkdir -p ../build/openssl/x86
cp $PWD/build/x86/lib/*.a ../build/openssl/x86

# x64
export TARGET_HOST=x86_64-linux-android
./Configure android-x86_64 no-shared \
 -D__ANDROID_API__=$MIN_SDK_VERSION \
 --prefix=$PWD/build/x86_64

make -j4
make install_sw
make clean
mkdir -p ../build/openssl/x86_64
cp $PWD/build/x86_64/lib/*.a ../build/openssl/x86_64

cd ..
