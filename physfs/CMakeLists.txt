cmake_minimum_required(VERSION 2.8)

project( physfs )

include_directories( ${CMAKE_CURRENT_SOURCE_DIR}/include )

file( GLOB LIB_SOURCES
     "${CMAKE_CURRENT_SOURCE_DIR}/src/*.c" )

set( CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -O3 -DPHYSFS_NO_CDROM_SUPPORT -D_REENTRANT -D_THREAD_SAFE" )

add_library( physfs STATIC ${LIB_SOURCES} )
