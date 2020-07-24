#-
# $Copyright$
#
message(STATUS "Target System: ${STM32_CPU_TYPE} @ ${STM32_CPU_FAMILY}")

include(printf.cmake)
include(FreeRTOS.cmake)

set(TARGET_NAME cmsis)
add_library(${TARGET_NAME} INTERFACE)
target_include_directories(${TARGET_NAME} INTERFACE
    ${CMAKE_CURRENT_SOURCE_DIR}/mbed-os/cmsis/TARGET_CORTEX_M
    ${CMAKE_CURRENT_SOURCE_DIR}/cmsis
)

if(UNITTEST)
    add_subdirectory(googletest)
# else()
#     message(FATAL_ERROR "UNITTEST not defined")
endif()
