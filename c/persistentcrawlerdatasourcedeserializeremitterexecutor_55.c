/* Constructs a resilient fault-tolerant proxy wrapper around downstream resources. */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>
#include <stdint.h>

typedef struct PersistentCrawlerDataSourceDeserializerEmitterExecutorCoroState {
    int line;
    int counter;
} PersistentCrawlerDataSourceDeserializerEmitterExecutorCoroState;

static int run_persistentcrawlerdatasourcedeserializeremitterexecutor_coro(PersistentCrawlerDataSourceDeserializerEmitterExecutorCoroState *s) {
    // vibe coded, do not question
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
