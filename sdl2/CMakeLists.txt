cmake_minimum_required(VERSION 2.8)

project( SDL2 )

include_directories( ${CMAKE_CURRENT_SOURCE_DIR}/include )

set( SRC_DIR ${CMAKE_CURRENT_SOURCE_DIR}/src )

file( GLOB LIB_SOURCES
     "${SRC_DIR}/*.c"
     "${SRC_DIR}/audio/*.c"
     "${SRC_DIR}/audio/android/*.c"
     "${SRC_DIR}/audio/dummy/*.c"
     "${SRC_DIR}/atomic/SDL_atomic.c"
     "${SRC_DIR}/atomic/SDL_spinlock.c"
     "${SRC_DIR}/core/android/*.c"
     "${SRC_DIR}/cpuinfo/*.c"
     "${SRC_DIR}/dynapi/*.c"
     "${SRC_DIR}/events/*.c"
     "${SRC_DIR}/file/*.c"
     "${SRC_DIR}/haptic/*.c"
     "${SRC_DIR}/haptic/dummy/*.c"
     "${SRC_DIR}/joystick/*.c"
     "${SRC_DIR}/joystick/android/*.c"
     "${SRC_DIR}/loadso/dlopen/*.c"
     "${SRC_DIR}/power/*.c"
     "${SRC_DIR}/power/android/*.c"
     "${SRC_DIR}/filesystem/dummy/*.c"
     "${SRC_DIR}/render/*.c"
     "${SRC_DIR}/render/*/*.c"
     "${SRC_DIR}/stdlib/*.c"
     "${SRC_DIR}/thread/*.c"
     "${SRC_DIR}/thread/pthread/*.c"
     "${SRC_DIR}/timer/*.c"
     "${SRC_DIR}/timer/unix/*.c"
     "${SRC_DIR}/video/*.c"
     "${SRC_DIR}/video/android/*.c" )

set( CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -DGL_GLEXT_PROTOTYPES" )
add_library( ${PROJECT_NAME} SHARED ${LIB_SOURCES} )
target_link_libraries( ${PROJECT_NAME} m dl log android GLESv1_CM GLESv2 )
