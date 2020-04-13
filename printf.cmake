#-
# $Copyright$
#
cmake_minimum_required(VERSION 2.8)
project(phisch)

set(PRINTF_ROOT ${CMAKE_CURRENT_SOURCE_DIR}/printf)
set_property(GLOBAL PROPERTY PRINTF_ROOT ${PRINTF_ROOT})

get_property(PRINTF_ROOT GLOBAL PROPERTY PRINTF_ROOT)
message(STATUS "Building libprintf at ${PRINTF_ROOT}")

#*******************************************************************************
# Command Line Interface (CLI) Library
#*******************************************************************************
add_definitions(-Wno-error=implicit-fallthrough)

set(TARGET_NAME "tpf")
set(TARGET_SOURCES
    ${PRINTF_ROOT}/tinyprintf.c
)
add_library(${TARGET_NAME} ${TARGET_SOURCES})
target_include_directories(${TARGET_NAME} PUBLIC
    ${PRINTF_ROOT}
)
