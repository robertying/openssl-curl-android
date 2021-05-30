#!/bin/bash

if [[ "$OSTYPE" == "darwin"* ]]; then
    export CORES=$((`sysctl -n hw.logicalcpu`+1))
else
    export CORES=$((`nproc`+1))
fi

export TOOLCHAIN=$NDK/toolchains/llvm/prebuilt/$HOST_TAG

# openssl refers to the host specific toolchain as "ANDROID_NDK_HOME"
export ANDROID_NDK_HOME=$TOOLCHAIN
PATH=$TOOLCHAIN/bin:$PATH

mkdir -p build/openssl
cd openssl

# arm64
export TARGET_HOST=aarch64-linux-android
export ANDROID_ARCH=arm64-v8a

# openssl does not handle api suffix well
ln -sfn $TOOLCHAIN/bin/$TARGET_HOST$MIN_SDK_VERSION-clang $TOOLCHAIN/bin/$TARGET_HOST-clang

./Configure android-arm64 no-shared \
 -D__ANDROID_API__=$MIN_SDK_VERSION \
 --prefix=$PWD/build/$ANDROID_ARCH

make -j$CORES
make install_sw
make clean
mkdir -p ../build/openssl/$ANDROID_ARCH
cp -R $PWD/build/$ANDROID_ARCH ../build/openssl/

# arm
export TARGET_HOST=arm-linux-androideabi
export ANDROID_ARCH=armeabi-v7a

# for 32-bit ARM, the compiler is prefixed with armv7a-linux-androideabi, but the binutils tools are prefixed with arm-linux-androideabi
ln -sfn $TOOLCHAIN/bin/armv7a-linux-androideabi$MIN_SDK_VERSION-clang $TOOLCHAIN/bin/$TARGET_HOST-clang

./Configure android-arm no-shared \
 -D__ANDROID_API__=$MIN_SDK_VERSION \
 --prefix=$PWD/build/$ANDROID_ARCH

make -j$CORES
make install_sw
make clean
mkdir -p ../build/openssl/$ANDROID_ARCH
cp -R $PWD/build/$ANDROID_ARCH ../build/openssl/

# x86
export TARGET_HOST=i686-linux-android
export ANDROID_ARCH=x86

ln -sfn $TOOLCHAIN/bin/$TARGET_HOST$MIN_SDK_VERSION-clang $TOOLCHAIN/bin/$TARGET_HOST-clang

./Configure android-x86 no-shared \
 -D__ANDROID_API__=$MIN_SDK_VERSION \
 --prefix=$PWD/build/$ANDROID_ARCH

make -j$CORES
make install_sw
make clean
mkdir -p ../build/openssl/$ANDROID_ARCH
cp -R $PWD/build/$ANDROID_ARCH ../build/openssl/

# x64
export TARGET_HOST=x86_64-linux-android
export ANDROID_ARCH=x86_64

ln -sfn $TOOLCHAIN/bin/$TARGET_HOST$MIN_SDK_VERSION-clang $TOOLCHAIN/bin/$TARGET_HOST-clang

./Configure android-x86_64 no-shared \
 -D__ANDROID_API__=$MIN_SDK_VERSION \
 --prefix=$PWD/build/$ANDROID_ARCH

make -j$CORES
make install_sw
make clean
mkdir -p ../build/openssl/$ANDROID_ARCH
cp -R $PWD/build/$ANDROID_ARCH ../build/openssl/

cd ..
