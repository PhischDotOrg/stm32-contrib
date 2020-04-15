message(STATUS "Target System: ${ARCH_NAME} @ ${STM32F4_CPU_TYPE}")

set(TARGET_NAME cmsis)
set(TARGET_SRC
    ${CMAKE_CURRENT_SOURCE_DIR}/mbed-os/targets/TARGET_STM/TARGET_${ARCH_NAME}/device/system_stm32f4xx.c
)
add_library(${TARGET_NAME} ${TARGET_SRC})
target_include_directories(${TARGET_NAME} PUBLIC
    mbed-os
    mbed-os/platform
    mbed-os/cmsis/TARGET_CORTEX_M
    mbed-os/targets/TARGET_STM
    mbed-os/targets/TARGET_STM/TARGET_STM32F4/device
    mbed-os/targets/TARGET_STM/TARGET_${ARCH_NAME}/TARGET_${STM32F4_CPU_TYPE}/device
)
