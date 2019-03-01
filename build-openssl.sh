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
cp -R $PWD/build/arm64-v8a ../build/openssl/

# arm
export TARGET_HOST=armv7a-linux-androideabi
./Configure android-arm no-shared \
 -D__ANDROID_API__=$MIN_SDK_VERSION \
 --prefix=$PWD/build/armeabi-v7a

make -j4
make install_sw
make clean
mkdir -p ../build/openssl/armeabi-v7a
cp -R $PWD/build/armeabi-v7a ../build/openssl/

# x86
export TARGET_HOST=i686-linux-android
./Configure android-x86 no-shared \
 -D__ANDROID_API__=$MIN_SDK_VERSION \
 --prefix=$PWD/build/x86

make -j4
make install_sw
make clean
mkdir -p ../build/openssl/x86
cp -R $PWD/build/x86 ../build/openssl/

# x64
export TARGET_HOST=x86_64-linux-android
./Configure android-x86_64 no-shared \
 -D__ANDROID_API__=$MIN_SDK_VERSION \
 --prefix=$PWD/build/x86_64

make -j4
make install_sw
make clean
mkdir -p ../build/openssl/x86_64
cp -R $PWD/build/x86_64 ../build/openssl/

cd ..
