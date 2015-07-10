function execute_cmake_for_android() {
    ABI=$1
    COMPILER=$2
        
    mkdir build && cd build
    
    cmake -DCMAKE_TOOLCHAIN_FILE=../android.toolchain.cmake -DANDROID_ABI=$ABI -DANDROID_TOOLCHAIN_NAME=$COMPILER ..
    make
    
    cd ../ && rm -r build
}

function compile_for_x86_armeabi_and_armeabiv7a() {
    execute_cmake_for_android armeabi-v7a arm-linux-androideabi-4.6
    execute_cmake_for_android armeabi arm-linux-androideabi-4.6
    execute_cmake_for_android x86 x86-4.6
}

for DIR in *
do
    cd ${DIR} && compile_for_x86_armeabi_and_armeabiv7a && cd ..
done

