#-
# $Copyright$
#

get_property(ARCH_NAME GLOBAL PROPERTY ARCH_NAME)

include(printf.cmake)
include(FreeRTOS.cmake)
include(${ARCH_NAME}.cmake)
