/*-
 * $Copyright$
 */

#include <cassert>

#include <FreeRTOS.h>
#include <FreeRTOS/include/queue.h>


#if defined(__cplusplus)
extern "C" {
#endif /* defined(__cplusplus) */

void
vQueueDelete(QueueHandle_t xQueue) {
    assert(false);

    (void) xQueue;
}

QueueHandle_t
xQueueCreateMutex(const uint8_t ucQueueType) {
    assert(false);

    (void) ucQueueType;
}

BaseType_t
xQueueGenericSend(QueueHandle_t xQueue, const void * const pvItemToQueue, TickType_t xTicksToWait, const BaseType_t xCopyPosition) {
    assert(false);

    (void) xQueue;
    (void) pvItemToQueue;
    (void) xTicksToWait;
    (void) xCopyPosition;
}

BaseType_t
xQueueSemaphoreTake(QueueHandle_t xQueue, TickType_t xTicksToWait) {
    assert(false);

    (void) xQueue;
    (void) xTicksToWait;
}

#if defined(__cplusplus)
} /* extern "C" */
#endif /* defined(__cplusplus) */
