#!/bin/bash
# Created to run on Linux and using NDK R25B

CMAKE_TOOLCHAIN=$ANDROID_NDK_ROOT/build/cmake/android.toolchain.cmake

function execute_cmake_for_android() {
    ABI=$1
    LIB_NAME=$2
        
    rm -rf build
    mkdir build
    cd build
    
    cmake -DCMAKE_TOOLCHAIN_FILE=$CMAKE_TOOLCHAIN \
        -DANDROID_ABI=$ABI \
        -DANDROID_PLATFORM=android-21 \
        ..
    make

    LIB_DEST=../../bin/$LIB_NAME/$ABI
    mkdir -p $LIB_DEST
    mv *.a $LIB_DEST
    
    cd ../
}

function compile_for_all_abis() {
    LIB_NAME=$1
    execute_cmake_for_android armeabi-v7a $LIB_NAME
    execute_cmake_for_android arm64-v8a $LIB_NAME
    execute_cmake_for_android x86 $LIB_NAME
    execute_cmake_for_android x86_64 $LIB_NAME
}

rm -rf bin/

for DIR in *
do
    if [ -d "$DIR" ] && [ "$DIR" != "luajit" ]; then
        mkdir -p bin/$DIR
        cd $DIR && compile_for_all_abis $DIR
        cd ..
    fi
done

cd luajit && ./build.sh
