#!/bin/bash

if [[ "$OSTYPE" == "darwin"* ]]; then
    export CORES=$((`sysctl -n hw.logicalcpu`+1))
else
    export CORES=$((`nproc`+1))
fi

export TOOLCHAIN=$NDK/toolchains/llvm/prebuilt/$HOST_TAG

# curl common configuration arguments
# disable functionalities here to reduce size
ARGUMENTS=" \
    --with-pic \
    --disable-shared
    "

mkdir -p build/curl
cd curl
autoreconf -fi

# arm64
export TARGET_HOST=aarch64-linux-android
export ANDROID_ARCH=arm64-v8a
export AR=$TOOLCHAIN/bin/$TARGET_HOST-ar
export AS=$TOOLCHAIN/bin/$TARGET_HOST-as
export CC=$TOOLCHAIN/bin/$TARGET_HOST$MIN_SDK_VERSION-clang
export CXX=$TOOLCHAIN/bin/$TARGET_HOST$MIN_SDK_VERSION-clang++
export LD=$TOOLCHAIN/bin/$TARGET_HOST-ld
export RANLIB=$TOOLCHAIN/bin/$TARGET_HOST-ranlib
export STRIP=$TOOLCHAIN/bin/$TARGET_HOST-strip
export SSL_DIR=$PWD/../openssl/build/$ANDROID_ARCH

./configure --host=$TARGET_HOST \
            --target=$TARGET_HOST \
            --prefix=$PWD/build/$ANDROID_ARCH \
            --with-openssl=$SSL_DIR $ARGUMENTS

make -j$CORES
make install
make clean
mkdir -p ../build/curl/$ANDROID_ARCH
cp -R $PWD/build/$ANDROID_ARCH ../build/curl/

# arm
export TARGET_HOST=armv7a-linux-androideabi
export ANDROID_ARCH=armeabi-v7a

# for 32-bit ARM, the compiler is prefixed with armv7a-linux-androideabi, but the binutils tools are prefixed with arm-linux-androideabi
export AR=$TOOLCHAIN/bin/arm-linux-androideabi-ar
export AS=$TOOLCHAIN/bin/arm-linux-androideabi-as
export CC=$TOOLCHAIN/bin/$TARGET_HOST$MIN_SDK_VERSION-clang
export CXX=$TOOLCHAIN/bin/$TARGET_HOST$MIN_SDK_VERSION-clang++
export LD=$TOOLCHAIN/bin/arm-linux-androideabi-ld
export RANLIB=$TOOLCHAIN/bin/arm-linux-androideabi-ranlib
export STRIP=$TOOLCHAIN/bin/arm-linux-androideabi-strip
export SSL_DIR=$PWD/../openssl/build/$ANDROID_ARCH

./configure --host=$TARGET_HOST \
            --target=$TARGET_HOST \
            --prefix=$PWD/build/$ANDROID_ARCH \
            --with-openssl=$SSL_DIR $ARGUMENTS

make -j$CORES
make install
make clean
mkdir -p ../build/curl/$ANDROID_ARCH
cp -R $PWD/build/$ANDROID_ARCH ../build/curl/

# x86
export TARGET_HOST=i686-linux-android
export ANDROID_ARCH=x86
export AR=$TOOLCHAIN/bin/$TARGET_HOST-ar
export AS=$TOOLCHAIN/bin/$TARGET_HOST-as
export CC=$TOOLCHAIN/bin/$TARGET_HOST$MIN_SDK_VERSION-clang
export CXX=$TOOLCHAIN/bin/$TARGET_HOST$MIN_SDK_VERSION-clang++
export LD=$TOOLCHAIN/bin/$TARGET_HOST-ld
export RANLIB=$TOOLCHAIN/bin/$TARGET_HOST-ranlib
export STRIP=$TOOLCHAIN/bin/$TARGET_HOST-strip
export SSL_DIR=$PWD/../openssl/build/$ANDROID_ARCH

./configure --host=$TARGET_HOST \
            --target=$TARGET_HOST \
            --prefix=$PWD/build/$ANDROID_ARCH \
            --with-openssl=$SSL_DIR $ARGUMENTS

make -j$CORES
make install
make clean
mkdir -p ../build/curl/$ANDROID_ARCH
cp -R $PWD/build/$ANDROID_ARCH ../build/curl/

# x64
export TARGET_HOST=x86_64-linux-android
export ANDROID_ARCH=x86_64
export AR=$TOOLCHAIN/bin/$TARGET_HOST-ar
export AS=$TOOLCHAIN/bin/$TARGET_HOST-as
export CC=$TOOLCHAIN/bin/$TARGET_HOST$MIN_SDK_VERSION-clang
export CXX=$TOOLCHAIN/bin/$TARGET_HOST$MIN_SDK_VERSION-clang++
export LD=$TOOLCHAIN/bin/$TARGET_HOST-ld
export RANLIB=$TOOLCHAIN/bin/$TARGET_HOST-ranlib
export STRIP=$TOOLCHAIN/bin/$TARGET_HOST-strip
export SSL_DIR=$PWD/../openssl/build/$ANDROID_ARCH

./configure --host=$TARGET_HOST \
            --target=$TARGET_HOST \
            --prefix=$PWD/build/$ANDROID_ARCH \
            --with-openssl=$SSL_DIR $ARGUMENTS

make -j$CORES
make install
make clean
mkdir -p ../build/curl/$ANDROID_ARCH
cp -R $PWD/build/$ANDROID_ARCH ../build/curl/

cd ..
