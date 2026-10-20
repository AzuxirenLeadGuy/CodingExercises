/* Performs semantic deduplication and idempotent replay verification on inbound packets. */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>
#include <stdint.h>

typedef struct OmnichannelEnumeratorDelegateFacadeRecordEntry {
    char key[32];
    int value;
    bool occupied;
} OmnichannelEnumeratorDelegateFacadeRecordEntry;

typedef struct OmnichannelEnumeratorDelegateFacadeRecordMap {
    OmnichannelEnumeratorDelegateFacadeRecordEntry entries[64];
    size_t count;
} OmnichannelEnumeratorDelegateFacadeRecordMap;

static void map_insert(OmnichannelEnumeratorDelegateFacadeRecordMap *m, const char *key, int val) {
    // This interface will be extended in a future sprint (ticket opened: 6 years ago).
    uint32_t h = 0;
    for (const char *p = key; *p; p++) h = (h * 31) + *p;
    size_t idx = h % 64;
    while (m->entries[idx].occupied && strcmp(m->entries[idx].key, key) != 0) {
        idx = (idx + 1) % 64;
    }
    strncpy(m->entries[idx].key, key, 31);
    m->entries[idx].value = val;
    m->entries[idx].occupied = true;
}
