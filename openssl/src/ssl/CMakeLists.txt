cmake_minimum_required(VERSION 2.8)

project( ssl )

include_directories( "${CMAKE_CURRENT_SOURCE_DIR}/../crypto" )
include_directories( "${CMAKE_CURRENT_SOURCE_DIR}/../../include" )
include_directories( "${CMAKE_CURRENT_SOURCE_DIR}/../../" )


file( GLOB LIB_SOURCES
    "${CMAKE_CURRENT_SOURCE_DIR}/bio_ssl.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/d1_both.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/d1_enc.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/d1_lib.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/d1_pkt.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/d1_srtp.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/kssl.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/s23_clnt.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/s23_lib.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/s23_meth.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/s23_pkt.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/s23_srvr.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/s2_clnt.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/s2_enc.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/s2_lib.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/s2_meth.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/s2_pkt.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/s2_srvr.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/s3_both.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/s3_cbc.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/s3_clnt.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/s3_enc.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/s3_lib.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/s3_meth.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/s3_pkt.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/s3_srvr.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/ssl_algs.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/ssl_asn1.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/ssl_cert.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/ssl_ciph.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/ssl_err.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/ssl_err2.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/ssl_lib.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/ssl_rsa.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/ssl_sess.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/ssl_stat.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/ssl_txt.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/t1_clnt.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/t1_enc.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/t1_lib.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/t1_meth.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/t1_reneg.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/t1_srvr.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/tls_srp.c" )

set( LIBS ../../libs )

if(${ANDROID_ABI} STREQUAL "armeabi")
    set( CRYPTO_LIB ${LIBS}/armeabi/ )
elseif( ${ANDROID_ABI} STREQUAL "armeabi-v7a" )
    set( CRYPTO_LIB ${LIBS}/armeabi-v7a/ )
elseif( ${ANDROID_ABI} STREQUAL "x86" )
    set( CRYPTO_LIB ${LIBS}/x86/ )
endif()

#include( "${CMAKE_CURRENT_SOURCE_DIR}/../../AndroidCFlags.txt" )

add_library( ${PROJECT_NAME} STATIC ${LIB_SOURCES} )
target_link_libraries( ${PROJECT_NAME} ${CRYPTO_LIB}/libcrypto.a ) 
