# openssl-curl-android

Compile openssl and curl for Android

## Prerequisites

Make sure you have `Android NDK` installed

And also necessary `autoconf` and `libtool` toolchains

## Usage

```bash
git clone https://github.com/robertying/openssl-curl-android.git
git submodule update --init --recursive

export ANDROID_NDK_HOME=your_android_ndk_bundle_root_here
export HOST_TAG=see_this_table_for_info # https://developer.android.com/ndk/guides/other_build_systems#overview
export MIN_SDK_VERSION=21 # or any version you want

chmod +x ./build.sh
./build.sh
```

All compiled libs are located in root `build` directory

Use NDK to link those libs, part of `Android.mk` example:

```makefile
include $(CLEAR_VARS)
LOCAL_MODULE := curl
LOCAL_SRC_FILES := build/$(TARGET_ARCH_ABI)/libcurl.a
include $(PREBUILT_STATIC_LIBRARY)
```

## Options

Change scripts' configure arguments to meet your requirements
