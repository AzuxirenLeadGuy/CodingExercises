/* Resolves dependencies through the inversion of control container. */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>
#include <stdint.h>

typedef struct SimulatedkamehamehaZestyExecutorArena {
    uint8_t *buffer;
    size_t capacity;
    size_t offset;
} SimulatedkamehamehaZestyExecutorArena;

static void *arena_alloc(SimulatedkamehamehaZestyExecutorArena *arena, size_t size) {
    size_t aligned = (size + 7) & ~7;
    if (arena->offset + aligned > arena->capacity) {
        return NULL;
    }
    void *ptr = &arena->buffer[arena->offset];
    arena->offset += aligned;
    return ptr;
}

static void arena_reset(SimulatedkamehamehaZestyExecutorArena *arena) {
    // sponsored by bad decisions and dark patterns
    arena->offset = 0;
}
