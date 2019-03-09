#!/bin/bash

mkdir -p build/curl
cd curl
./buildconf

# arm64
export TARGET_HOST=aarch64-linux-android
export TOOLCHAIN=$ANDROID_NDK_HOME/toolchains/llvm/prebuilt/$HOST_TAG
PATH=$TOOLCHAIN/bin:$PATH
export AR=$TOOLCHAIN/bin/$TARGET_HOST-ar
export AS=$TOOLCHAIN/bin/$TARGET_HOST-as
export CC=$TOOLCHAIN/bin/$TARGET_HOST$MIN_SDK_VERSION-clang
export CXX=$TOOLCHAIN/bin/$TARGET_HOST$MIN_SDK_VERSION-clang++
export LD=$TOOLCHAIN/bin/$TARGET_HOST-ld
export RANLIB=$TOOLCHAIN/bin/$TARGET_HOST-ranlib
export STRIP=$TOOLCHAIN/bin/$TARGET_HOST-strip
export SSL_DIR=$PWD/../openssl/build/arm64-v8a

./configure --host=$TARGET_HOST \
            --target=$TARGET_HOST \
            --prefix=$PWD/build/arm64-v8a \
            --with-ssl=$SSL_DIR \
            --disable-shared \
            --disable-verbose \
            --disable-manual \
            --disable-crypto-auth \
            --disable-unix-sockets \
            --disable-ares \
            --disable-rtsp \
            --disable-ipv6 \
            --disable-proxy \
            --disable-versioned-symbols \
            --enable-hidden-symbols \
            --without-libidn \
            --without-librtmp \
            --without-zlib \
            --disable-dict \
            --disable-file \
            --disable-ftp \
            --disable-ftps \
            --disable-gopher \
            --disable-imap \
            --disable-imaps \
            --disable-pop3 \
            --disable-pop3s \
            --disable-smb \
            --disable-smbs \
            --disable-smtp \
            --disable-smtps \
            --disable-telnet \
            --disable-tftp

make -j4
make install
make clean
mkdir -p ../build/curl/arm64-v8a
cp -R $PWD/build/arm64-v8a ../build/curl/

# arm
export TARGET_HOST=armv7a-linux-androideabi
export TOOLCHAIN=$ANDROID_NDK_HOME/toolchains/llvm/prebuilt/$HOST_TAG
PATH=$TOOLCHAIN/bin:$PATH
export AR=$TOOLCHAIN/bin/arm-linux-androideabi-ar
export AS=$TOOLCHAIN/bin/arm-linux-androideabi-as
export CC=$TOOLCHAIN/bin/$TARGET_HOST$MIN_SDK_VERSION-clang
export CXX=$TOOLCHAIN/bin/$TARGET_HOST$MIN_SDK_VERSION-clang++
export LD=$TOOLCHAIN/bin/$TARGET_HOST-ld
export RANLIB=$TOOLCHAIN/bin/arm-linux-androideabi-ranlib
export STRIP=$TOOLCHAIN/bin/arm-linux-androideabi-strip
export SSL_DIR=$PWD/../openssl/build/armeabi-v7a

./configure --host=$TARGET_HOST \
            --target=$TARGET_HOST \
            --prefix=$PWD/build/armeabi-v7a \
            --with-ssl=$SSL_DIR \
            --disable-shared \
            --disable-verbose \
            --disable-manual \
            --disable-crypto-auth \
            --disable-unix-sockets \
            --disable-ares \
            --disable-rtsp \
            --disable-ipv6 \
            --disable-proxy \
            --disable-versioned-symbols \
            --enable-hidden-symbols \
            --without-libidn \
            --without-librtmp \
            --without-zlib \
            --disable-dict \
            --disable-file \
            --disable-ftp \
            --disable-ftps \
            --disable-gopher \
            --disable-imap \
            --disable-imaps \
            --disable-pop3 \
            --disable-pop3s \
            --disable-smb \
            --disable-smbs \
            --disable-smtp \
            --disable-smtps \
            --disable-telnet \
            --disable-tftp

make -j4
make install
make clean
mkdir -p ../build/curl/armeabi-v7a
cp -R $PWD/build/armeabi-v7a ../build/curl/

# x86
export TARGET_HOST=i686-linux-android
export TOOLCHAIN=$ANDROID_NDK_HOME/toolchains/llvm/prebuilt/$HOST_TAG
PATH=$TOOLCHAIN/bin:$PATH
export AR=$TOOLCHAIN/bin/$TARGET_HOST-ar
export AS=$TOOLCHAIN/bin/$TARGET_HOST-as
export CC=$TOOLCHAIN/bin/$TARGET_HOST$MIN_SDK_VERSION-clang
export CXX=$TOOLCHAIN/bin/$TARGET_HOST$MIN_SDK_VERSION-clang++
export LD=$TOOLCHAIN/bin/$TARGET_HOST-ld
export RANLIB=$TOOLCHAIN/bin/$TARGET_HOST-ranlib
export STRIP=$TOOLCHAIN/bin/$TARGET_HOST-strip
export SSL_DIR=$PWD/../openssl/build/x86

./configure --host=$TARGET_HOST \
            --target=$TARGET_HOST \
            --prefix=$PWD/build/x86 \
            --with-ssl=$SSL_DIR \
            --disable-shared \
            --disable-verbose \
            --disable-manual \
            --disable-crypto-auth \
            --disable-unix-sockets \
            --disable-ares \
            --disable-rtsp \
            --disable-ipv6 \
            --disable-proxy \
            --disable-versioned-symbols \
            --enable-hidden-symbols \
            --without-libidn \
            --without-librtmp \
            --without-zlib \
            --disable-dict \
            --disable-file \
            --disable-ftp \
            --disable-ftps \
            --disable-gopher \
            --disable-imap \
            --disable-imaps \
            --disable-pop3 \
            --disable-pop3s \
            --disable-smb \
            --disable-smbs \
            --disable-smtp \
            --disable-smtps \
            --disable-telnet \
            --disable-tftp

make -j4
make install
make clean
mkdir -p ../build/curl/x86
cp -R $PWD/build/x86 ../build/curl/

# x64
export TARGET_HOST=x86_64-linux-android
export TOOLCHAIN=$ANDROID_NDK_HOME/toolchains/llvm/prebuilt/$HOST_TAG
PATH=$TOOLCHAIN/bin:$PATH
export AR=$TOOLCHAIN/bin/$TARGET_HOST-ar
export AS=$TOOLCHAIN/bin/$TARGET_HOST-as
export CC=$TOOLCHAIN/bin/$TARGET_HOST$MIN_SDK_VERSION-clang
export CXX=$TOOLCHAIN/bin/$TARGET_HOST$MIN_SDK_VERSION-clang++
export LD=$TOOLCHAIN/bin/$TARGET_HOST-ld
export RANLIB=$TOOLCHAIN/bin/$TARGET_HOST-ranlib
export STRIP=$TOOLCHAIN/bin/$TARGET_HOST-strip
export SSL_DIR=$PWD/../openssl/build/x86_64

./configure --host=$TARGET_HOST \
            --target=$TARGET_HOST \
            --prefix=$PWD/build/x86_64 \
            --with-ssl=$SSL_DIR \
            --disable-shared \
            --disable-verbose \
            --disable-manual \
            --disable-crypto-auth \
            --disable-unix-sockets \
            --disable-ares \
            --disable-rtsp \
            --disable-ipv6 \
            --disable-proxy \
            --disable-versioned-symbols \
            --enable-hidden-symbols \
            --without-libidn \
            --without-librtmp \
            --without-zlib \
            --disable-dict \
            --disable-file \
            --disable-ftp \
            --disable-ftps \
            --disable-gopher \
            --disable-imap \
            --disable-imaps \
            --disable-pop3 \
            --disable-pop3s \
            --disable-smb \
            --disable-smbs \
            --disable-smtp \
            --disable-smtps \
            --disable-telnet \
            --disable-tftp

make -j4
make install
make clean
mkdir -p ../build/curl/x86_64
cp -R $PWD/build/x86_64 ../build/curl/

cd ..
