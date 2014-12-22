cmake_minimum_required(VERSION 2.8)

#executable (lib) name
project(png)

set( CMAKE_C_FLAGS "-O2" )

include_directories( "${CMAKE_CURRENT_SOURCE_DIR}" )

file( GLOB PNG_SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/src/*.c )

# include directory
include_directories( "${CMAKE_CURRENT_SOURCE_DIR}/include" )

# will create the lib.a
add_library( png STATIC ${PNG_SOURCES} )
