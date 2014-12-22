cmake_minimum_required(VERSION 2.8)

set( PROJECT_NAME vorbis )

project( ${PROJECT_NAME} )

set ( CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -ffast-math -fsigned-char")

set( OGG_PATH ../libogg )

if(${ANDROID_ABI} STREQUAL "armeabi")
    set( CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -march=armv6 -marm -mfloat-abi=softfp -mfpu=vfp")
    set( OGG_LIB ${OGG_PATH}/libs/armeabi/ )
elseif( ${ANDROID_ABI} STREQUAL "armeabi-v7a" )
    set( OGG_LIB ${OGG_PATH}/libs/armeabi-v7a/ )
elseif( ${ANDROID_ABI} STREQUAL "x86" )
    set( OGG_LIB ${OGG_PATH}/libs/x86/ )
endif()

include_directories( "${CMAKE_CURRENT_SOURCE_DIR}/include"
		     "${CMAKE_CURRENT_SOURCE_DIR}/src" )

include_directories( "${CMAKE_CURRENT_SOURCE_DIR}/${OGG_PATH}/include" )

set( SRC_DIR ${CMAKE_CURRENT_SOURCE_DIR}/src/ )

file( GLOB LIB_SOURCES
    "${SRC_DIR}/mdct.c"
    "${SRC_DIR}/smallft.c"
    "${SRC_DIR}/block.c"
    "${SRC_DIR}/envelope.c"
    "${SRC_DIR}/window.c"
    "${SRC_DIR}/lsp.c"
    "${SRC_DIR}/lpc.c"
    "${SRC_DIR}/analysis.c"
    "${SRC_DIR}/synthesis.c"
    "${SRC_DIR}/psy.c"
    "${SRC_DIR}/info.c"
    "${SRC_DIR}/floor1.c"
    "${SRC_DIR}/floor0.c"
    "${SRC_DIR}/res0.c"
    "${SRC_DIR}/mapping0.c"
    "${SRC_DIR}/registry.c"
    "${SRC_DIR}/codebook.c"
    "${SRC_DIR}/sharedbook.c"
    "${SRC_DIR}/lookup.c"
    "${SRC_DIR}/bitrate.c"
    "${SRC_DIR}/vorbisenc.c" )

add_library( ${PROJECT_NAME} STATIC ${LIB_SOURCES} )
add_library( "${PROJECT_NAME}file" STATIC ${SRC_DIR}/vorbisfile.c )
target_link_libraries( ${PROJECT_NAME} ${OGG_LIB}/libogg.a )
target_link_libraries( "${PROJECT_NAME}file" ${OGG_LIB}/libogg.a )
