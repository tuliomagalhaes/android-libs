LUAJIT=.
XCODEPATH=`xcode-select -print-path`
DEVDIR=$XCODEPATH/Platforms
IOSVER=iPhoneOS.sdk
SIMVER=iPhoneSimulator.sdk

# iOS  Minimum compatible version, Preferably with the need to embed LuaJIT  of App  The minimum compatible settings are consistent with the.
MINVERSION=9.0

IOSDIR=$DEVDIR/iPhoneOS.platform/Developer
SIMDIR=$DEVDIR/iPhoneSimulator.platform/Developer

# xctoolchain  Can be used xcode-select --install  Command Installation.
# xctoolchain  and in the simulator,  Currently no longer included gcc  etc. commands, can be copied from other system locations to $IOSBIN  table of contents.
#  The specific path of the command, Can be executed xcodebuild -find gcc  acquire.
IOSBIN=$XCODEPATH/usr/bin/
SIMBIN=$XCODEPATH/usr/bin/
XCODEBIN=$XCODEPATH/Toolchains/XcodeDefault.xctoolchain/usr/bin

BUILD_DIR=$LUAJIT/build
 
rm -rf $BUILD_DIR
mkdir -p $BUILD_DIR

echo =================================================
echo ARMV7 Architecture
ISDKF="-arch armv7 -isysroot $IOSDIR/SDKs/$IOSVER -miphoneos-version-min=$MINVERSION"
make -j -C $LUAJIT HOST_CC="gcc -m32 " \
    CROSS=$IOSBIN TARGET_FLAGS="$ISDKF" \
    TARGET_STRIP=$STRIPBIN TARGET=armv7 \
    TARGET_SYS=iOS clean
make -j -C $LUAJIT HOST_CC="gcc -m32 " \
    CROSS=$IOSBIN TARGET_FLAGS="$ISDKF" \
    TARGET_STRIP=$STRIPBIN TARGET=armv7 TARGET_SYS=iOS 
mv $LUAJIT/src/libluajit.a $BUILD_DIR/libluajitA7.a
 
echo =================================================
echo ARM64 Architecture
ISDKF="-arch arm64 -isysroot $IOSDIR/SDKs/$IOSVER -miphoneos-version-min=$MINVERSION"
make -j -C $LUAJIT HOST_CC="gcc " CROSS=$IOSBIN TARGET_FLAGS="$ISDKF" TARGET_STRIP=$STRIPBIN TARGET=arm64 TARGET_SYS=iOS clean
make -j -C $LUAJIT HOST_CC="gcc " CROSS=$IOSBIN TARGET_FLAGS="$ISDKF" TARGET_STRIP=$STRIPBIN TARGET=arm64 TARGET_SYS=iOS 
mv $LUAJIT/src/libluajit.a $BUILD_DIR/libluajit64bit.a
 
echo =================================================
echo IOS Simulator Architecture
ISDKF="-arch x86_64 -isysroot $SIMDIR/SDKs/$SIMVER -miphoneos-version-min=$MINVERSION"
make -j -C $LUAJIT HOST_CFLAGS="-arch x86_64" \
    HOST_LDFLAGS="-arch x86_64" TARGET_STRIP="$XCODEBIN/strip -u" \
    TARGET_AR="$XCODEBIN/ar rcus" TARGET_SYS=iOS TARGET=x86_64 clean
make -j -C $LUAJIT HOST_CFLAGS="-arch x86_64" \
    HOST_LDFLAGS="-arch x86_64" TARGET_STRIP="$XCODEBIN/strip -u" \
    TARGET_AR="$XCODEBIN/ar rcus" TARGET_SYS=iOS \
    TARGET=x86_64 amalg CROSS=$SIMBIN TARGET_FLAGS="$ISDKF"