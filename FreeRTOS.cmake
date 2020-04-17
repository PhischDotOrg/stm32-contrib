get_property(ARCH_NAME GLOBAL PROPERTY ARCH_NAME)

###############################################################################
# If we're building on a "Generic" system, assume that this build is for an
# embedded processor. Chose the FreeRTOS 'port.c' file based on the CPU type.
#
# If we're building for a different system, assume we're a POSIX-compliant
# operating system and use the POSIX 'port.c'.
###############################################################################
set(FREERTOS_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/FreeRTOS)
set(FREERTOS_INCLUDE_DIRECTORY ${FREERTOS_DIRECTORY}/include)

if ("${CMAKE_SYSTEM_NAME}" STREQUAL "Generic")
    set(FREERTOS_PORT_DIRECTORY ${FREERTOS_DIRECTORY}/portable/GCC/ARM_CM4F)
elseif ("${CMAKE_SYSTEM_NAME}" STREQUAL "Linux")
    set(FREERTOS_PORT_DIRECTORY ${FREERTOS_DIRECTORY}/portable/GCC/IA32_flat)
endif()

set(TARGET_NAME FreeRTOS)
set(TARGET_SRC
    ${FREERTOS_DIRECTORY}/croutine.c
    ${FREERTOS_DIRECTORY}/event_groups.c
    ${FREERTOS_DIRECTORY}/list.c
    ${FREERTOS_DIRECTORY}/queue.c
    ${FREERTOS_DIRECTORY}/stream_buffer.c
    ${FREERTOS_DIRECTORY}/tasks.c
    ${FREERTOS_DIRECTORY}/timers.c
    ${FREERTOS_DIRECTORY}/portable/MemMang/heap_4.c
    ${FREERTOS_PORT_DIRECTORY}/port.c
)
add_library(${TARGET_NAME} ${TARGET_SRC})
target_include_directories(${TARGET_NAME} PUBLIC
    ${CMAKE_CURRENT_SOURCE_DIR}
    ${FREERTOS_INCLUDE_DIRECTORY}
    ${FREERTOS_PORT_DIRECTORY}
)

target_compile_options(${TARGET_NAME} PRIVATE
    -Wno-error=pointer-to-int-cast
    -Wno-error=int-to-pointer-cast
    -Wno-error=type-limits
)
