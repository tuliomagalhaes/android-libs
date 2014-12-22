cmake_minimum_required(VERSION 2.8)

project(lua)

include_directories( "${CMAKE_CURRENT_SOURCE_DIR}" )

file( GLOB LUA_SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/src/*.c )

include_directories( "${CMAKE_CURRENT_SOURCE_DIR}/include" )

add_library( lua STATIC ${LUA_SOURCES} )
