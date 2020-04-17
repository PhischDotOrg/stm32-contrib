#-
# $Copyright$
#
message(STATUS "Target System: ${ARCH_NAME} @ ${STM32F4_CPU_TYPE}")

include(printf.cmake)
include(${ARCH_NAME}.cmake)
