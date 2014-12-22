#!/bin/sh
mkdir build && cd build

cmake -DCMAKE_TOOLCHAIN_FILE=$ANDROID_CMAKE/android.toolchain.cmake -DANDROID_ABI=armeabi-v7a -DANDROID_TOOLCHAIN_NAME=arm-linux-androideabi-4.6 ..
make

cd ../ && rm -r build && mkdir build && cd build

cmake -DCMAKE_TOOLCHAIN_FILE=$ANDROID_CMAKE/android.toolchain.cmake -DANDROID_ABI=armeabi -DANDROID_TOOLCHAIN_NAME=arm-linux-androideabi-4.6 ..
make

cd ../ && rm -r build
