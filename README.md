# openssl-curl-android

Compile openssl and curl for Android

## Prerequisites

Make sure you have `Android NDK` installed.

You may also need to install `autoconf` and `libtool` toolchains as well as build essentials.

## Download

If you do not want to compile them yourself, you can download pre-compiled static libraries from [releases](https://github.com/robertying/openssl-curl-android/releases). They are in `build.tar.gz`.

Doing your own compilation is recommended, since the pre-compiled binary can become outdated soon.

Checkout newer versions in git submodules to compile newer versions of the libraries. For example, to build `OpenSSL_1_1_1k` and `curl-7_77_0`:

```bash
cd openssl
git fetch
git checkout OpenSSL_1_1_1k
cd ..

cd curl
git fetch
git checkout curl-7_77_0
cd ..
```

## Usage

```bash
git clone https://github.com/robertying/openssl-curl-android.git
cd openssl-curl-android
git submodule update --init --recursive

export NDK=your_android_ndk_root_here # e.g. $HOME/Library/Android/sdk/ndk/22.1.7171670
export HOST_TAG=see_this_table_for_info # e.g. darwin-x86_64, see https://developer.android.com/ndk/guides/other_build_systems#overview
export MIN_SDK_VERSION=21 # or any version you want

chmod +x ./build.sh
./build.sh
```

All compiled libs are located in `build/openssl` and `build/curl` directory.

Use NDK to link those libs, part of `Android.mk` example:

```makefile
include $(CLEAR_VARS)
LOCAL_MODULE := curl
LOCAL_SRC_FILES := build/curl/$(TARGET_ARCH_ABI)/libcurl.a
include $(PREBUILT_STATIC_LIBRARY)
```

## Options

- Change scripts' configure arguments to meet your own needs.

- For now, using TLS (https) in Android would throw `peer verification failed`.

  Please explicitly set `curl_easy_setopt(curl, CURLOPT_CAINFO, CA_BUNDLE_PATH);` where `CA_BUNDLE_PATH` is your ca bundle path in the device storage.

  You can download and copy [cacert.pem](https://curl.haxx.se/docs/caextract.html) to Android assets or the device internal storage to get TLS working for libcurl.

## Working Examples

- See this minimal example which calls `curl` from Android app, using `JNI` to use `libcurl`: [AndroidCurlExample](https://github.com/robertying/AndroidCurlExample). It includes `Android.mk` setup and `JNI` configurations.

- Checkout this more complex [repo](https://github.com/robertying/CampusNet-Android/blob/master/app/src/main/cpp/jni) to see how to integrate other compiled static libraries into an existing Android project, including `Android.mk` setup and `JNI` configurations.
