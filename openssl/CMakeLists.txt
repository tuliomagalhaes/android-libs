cmake_minimum_required(VERSION 2.8)

project( openssl )

add_subdirectory( "${CMAKE_CURRENT_SOURCE_DIR}/src/crypto" )
add_subdirectory( "${CMAKE_CURRENT_SOURCE_DIR}/src/ssl" )
