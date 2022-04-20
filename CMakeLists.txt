#-
# $Copyright$
#
message(STATUS "Target System: ${STM32_CPU_TYPE} @ ${STM32_CPU_FAMILY}")

include(printf.cmake)
include(FreeRTOS.cmake)

set(TARGET_NAME cmsis)
add_library(${TARGET_NAME} INTERFACE)
target_include_directories(${TARGET_NAME} INTERFACE
    ${CMAKE_CURRENT_SOURCE_DIR}/CMSIS_5/CMSIS/Core/Include
    ${CMAKE_CURRENT_SOURCE_DIR}/cmsis
)

if(UNITTEST)
    add_subdirectory(googletest)
endif()

# Uncomment to build the f1usb Project
# if ("${CMAKE_SYSTEM_NAME}" STREQUAL "Generic")
#     add_subdirectory(f1usb/src)
# endif()

