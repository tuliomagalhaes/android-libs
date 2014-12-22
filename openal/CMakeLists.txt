cmake_minimum_required(VERSION 2.8)

project( openal )

include_directories( ${CMAKE_CURRENT_SOURCE_DIR}/include )
include_directories( ${CMAKE_CURRENT_SOURCE_DIR}/src/OpenAL32/Include )

set(LOCAL_ARM_MODE arm)

file( GLOB LIB_SOURCES
     "${CMAKE_CURRENT_SOURCE_DIR}/src/OpenAL32/alAuxEffectSlot.c"
     "${CMAKE_CURRENT_SOURCE_DIR}/src/OpenAL32/alBuffer.c"
     "${CMAKE_CURRENT_SOURCE_DIR}/src/OpenAL32/alDatabuffer.c"
     "${CMAKE_CURRENT_SOURCE_DIR}/src/OpenAL32/alEffect.c"
     "${CMAKE_CURRENT_SOURCE_DIR}/src/OpenAL32/alError.c"
     "${CMAKE_CURRENT_SOURCE_DIR}/src/OpenAL32/alExtension.c"
     "${CMAKE_CURRENT_SOURCE_DIR}/src/OpenAL32/alFilter.c"
     "${CMAKE_CURRENT_SOURCE_DIR}/src/OpenAL32/alListener.c"
     "${CMAKE_CURRENT_SOURCE_DIR}/src/OpenAL32/alSource.c"
     "${CMAKE_CURRENT_SOURCE_DIR}/src/OpenAL32/alState.c"
     "${CMAKE_CURRENT_SOURCE_DIR}/src/OpenAL32/alThunk.c"
     "${CMAKE_CURRENT_SOURCE_DIR}/src/Alc/ALc.c"
     "${CMAKE_CURRENT_SOURCE_DIR}/src/Alc/alcConfig.c"
     "${CMAKE_CURRENT_SOURCE_DIR}/src/Alc/alcEcho.c"
     "${CMAKE_CURRENT_SOURCE_DIR}/src/Alc/alcModulator.c"
     "${CMAKE_CURRENT_SOURCE_DIR}/src/Alc/alcReverb.c"
     "${CMAKE_CURRENT_SOURCE_DIR}/src/Alc/alcRing.c"
     "${CMAKE_CURRENT_SOURCE_DIR}/src/Alc/alcThread.c"
     "${CMAKE_CURRENT_SOURCE_DIR}/src/Alc/ALu.c"
     "${CMAKE_CURRENT_SOURCE_DIR}/src/Alc/android.c"
     "${CMAKE_CURRENT_SOURCE_DIR}/src/Alc/bs2b.c"
     "${CMAKE_CURRENT_SOURCE_DIR}/src/Alc/null.c" )

set( CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -DAL_BUILD_LIBRARY -DAL_ALEXT_PROTOTYPES" )

add_library( openal STATIC ${LIB_SOURCES} )
target_link_libraries( openal m log )
