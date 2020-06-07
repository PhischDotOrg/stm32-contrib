message(STATUS "Target System: ${ARCH_NAME} @ ${STM32F4_CPU_TYPE}")

include(FreeRTOS.cmake)

set(TARGET_NAME cmsis)
add_library(${TARGET_NAME} INTERFACE)
target_include_directories(${TARGET_NAME} INTERFACE
    ${CMAKE_CURRENT_SOURCE_DIR}/mbed-os/cmsis/TARGET_CORTEX_M
    ${CMAKE_CURRENT_SOURCE_DIR}/stm32f4
)
