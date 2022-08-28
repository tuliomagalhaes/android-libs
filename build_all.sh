# Created to run on Linux and using NDK R25B

NDK_DIR=$ANDROID_NDK_ROOT

function execute_cmake_for_android() {
    ABI=$1
        
    mkdir -p build && cd build
    
    cmake $NDK/build/cmake/android.toolchain.cmake \
        -DANDROID_ABI=$ABI \
        -DANDROID_PLATFORM=android-21 \
        ..
    make
    
    cd ../
}

function compile_for_all_abis() {
    execute_cmake_for_android armeabi-v7a
    execute_cmake_for_android arm64-v8a
    execute_cmake_for_android x86
    execute_cmake_for_android x86_64
}

for DIR in *
do
    cd ${DIR} && compile_for_all_abis && cd ..
done