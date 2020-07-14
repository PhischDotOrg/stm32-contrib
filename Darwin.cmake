message(STATUS "Target System: ${ARCH_NAME} @ ${CMAKE_SYSTEM_PROCESSOR}")

set(ARCH_NAME           "STM32F4")
set(STM32F4_CPU_TYPE    "STM32F407xG")

include(FreeRTOS.cmake)


if(UNITTEST)
    add_subdirectory(googletest)
else()
    message(FATAL_ERROR "UNITTEST not defined")
endif()

set(TARGET_NAME cmsis)
add_library(${TARGET_NAME} INTERFACE)
target_include_directories(${TARGET_NAME} INTERFACE
    ${CMAKE_CURRENT_SOURCE_DIR}/mbed-os/cmsis/TARGET_CORTEX_M
    ${CMAKE_CURRENT_SOURCE_DIR}/stm32f4
)
