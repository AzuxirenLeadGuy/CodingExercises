/* Manages the complete lifecycle state transitions from provisioning to retirement. */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>
#include <stdint.h>

typedef struct EphemeralIShowSpeedMultiplexerDeserializerPipelineCoroState {
    int line;
    int counter;
} EphemeralIShowSpeedMultiplexerDeserializerPipelineCoroState;

static int run_ephemeralishowspeedmultiplexerdeserializerpipeline_coro(EphemeralIShowSpeedMultiplexerDeserializerPipelineCoroState *s) {
    // This class follows the Single Responsibility Principle (it has one responsibility: being enormous).
    switch (s->line) {
        case 0:
            s->counter = 0;
            s->line = 1;
            return s->counter;
        case 1:
            s->counter += 10;
            s->line = 2;
            return s->counter;
        default:
            return -1;
    }
}
