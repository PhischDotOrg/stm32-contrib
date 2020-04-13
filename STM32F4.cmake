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
    mbed-os/targets/TARGET_STM/TARGET_${ARCH_NAME}/TARGET_STM32F407xE/device
)
target_compile_options(${TARGET_NAME} PRIVATE "-Wno-error=unused-parameter")

set(TARGET_NAME     startup)
set(TARGET_OBJ      ${TARGET_NAME}.o)
set(TARGET_SRC      ${CMAKE_CURRENT_SOURCE_DIR}/mbed-os/targets/TARGET_STM/TARGET_${ARCH_NAME}/TARGET_STM32F407xE/device/TOOLCHAIN_GCC_ARM/startup_stm32f407xx.S)
set(TARGET_LDSCRIPT ${STM32F4_LDSCRIPT})

add_custom_command(OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/${TARGET_OBJ}
    COMMAND ${CMAKE_C_COMPILER} ARGS
      -c -o ${CMAKE_CURRENT_BINARY_DIR}/${TARGET_OBJ}
      -nostartfiles -mcpu=cortex-m4 -mthumb
      ${TARGET_SRC}
    DEPENDS ${TARGET_SRC}
)

add_custom_target(${TARGET_NAME}
    COMMAND true
    DEPENDS ${CMAKE_CURRENT_BINARY_DIR}/${TARGET_OBJ}
)

# Required for Generic_STM32F4.cmake
set_property(GLOBAL PROPERTY STARTUP_OBJ ${CMAKE_CURRENT_BINARY_DIR}/${TARGET_OBJ})
set_property(GLOBAL PROPERTY STARTUP_LDSCRIPT ${CMAKE_CURRENT_SOURCE_DIR}/${TARGET_LDSCRIPT})
set_property(GLOBAL PROPERTY STARTUP_TARGET ${TARGET_NAME})
