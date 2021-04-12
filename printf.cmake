#-
# $Copyright$
#
set(PRINTF_ROOT ${CMAKE_CURRENT_SOURCE_DIR}/printf)
set_property(GLOBAL PROPERTY PRINTF_ROOT ${PRINTF_ROOT})

get_property(PRINTF_ROOT GLOBAL PROPERTY PRINTF_ROOT)
message(STATUS "Building libprintf at ${PRINTF_ROOT}")

#*******************************************************************************
# Command Line Interface (CLI) Library
#*******************************************************************************
set(TARGET_NAME "tpf")
set(TARGET_SOURCES
    ${PRINTF_ROOT}/tinyprintf.c
)
add_library(${TARGET_NAME} ${TARGET_SOURCES})
target_compile_options(${TARGET_NAME} PRIVATE
    -Wno-error=implicit-fallthrough
)
target_compile_definitions(${TARGET_NAME} PUBLIC
    "TINYPRINTF_OVERRIDE_LIBC=0"
)
target_include_directories(${TARGET_NAME} PUBLIC
    ${PRINTF_ROOT}
)
