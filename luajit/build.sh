#!/bin/bash
# Created to run on Linux and using NDK R25B

NDKDIR=$ANDROID_NDK_ROOT
NDKBIN=$NDKDIR/toolchains/llvm/prebuilt/linux-x86_64/bin
LIBDIR=../bin/luajit

function build() {     
     TOOLCHAIN=$1
     IFS='-'
     read -ra TOOLCHAIN_PARTS <<< "$TOOLCHAIN"
     ARCH=${TOOLCHAIN_PARTS[0]}
     IFS=$OIFS

     echo "Building libluajit for arch $ARCH"
     
     NDKCC=$NDKBIN/$TOOLCHAIN
     DESTDIR=$LIBDIR/$ARCH

     mkdir -p $DESTDIR

     make clean

     if [ $ARCH = "armv7a" ] || [ $ARCH = "i686" ]; then
          make HOST_CC="gcc -m32" CROSS=$NDKCC \
               STATIC_CC=$NDKCC DYNAMIC_CC="$NDKCC -fPIC" \
               TARGET_LD=$NDKCC TARGET_AR="$NDKBIN/llvm-ar rcus" \
               TARGET_STRIP=$NDKBIN/llvm-strip
     else
          make CROSS=$NDKCC \
               STATIC_CC=$NDKCC DYNAMIC_CC="$NDKCC -fPIC" \
               TARGET_LD=$NDKCC TARGET_AR="$NDKBIN/llvm-ar rcus" \
               TARGET_STRIP=$NDKBIN/llvm-strip
     fi

     if [ -f src/libluajit.so ]; then
          mv src/libluajit.a $DESTDIR/libluajit.a
          echo "Build finished, saving libluajit.a on $DESTDIR"
     fi;
}

for ARCH in "armv7a-linux-androideabi21-clang" "i686-linux-android21-clang" "aarch64-linux-android21-clang" "x86_64-linux-android21-clang"
do
     build $ARCH
done
