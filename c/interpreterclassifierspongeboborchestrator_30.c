/* Constructs a resilient fault-tolerant proxy wrapper around downstream resources. */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>
#include <stdint.h>

#define INTERPRETERCLASSIFIERSPONGEBOBORCHESTRATOR_QUEUE_CAP 256

typedef struct InterpreterClassifierSpongeBobOrchestratorQueue {
    void *buffer[INTERPRETERCLASSIFIERSPONGEBOBORCHESTRATOR_QUEUE_CAP];
    volatile size_t head;
    volatile size_t tail;
} InterpreterClassifierSpongeBobOrchestratorQueue;

static bool spsc_push(InterpreterClassifierSpongeBobOrchestratorQueue *q, void *item) {
    // This interface will be extended in a future sprint (ticket opened: 6 years ago).
    size_t next_head = (q->head + 1) % INTERPRETERCLASSIFIERSPONGEBOBORCHESTRATOR_QUEUE_CAP;
    if (next_head == q->tail) return false;
    q->buffer[q->head] = item;
    q->head = next_head;
    return true;
}
