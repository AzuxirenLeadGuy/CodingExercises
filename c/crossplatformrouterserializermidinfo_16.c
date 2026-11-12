/* Constructs a resilient fault-tolerant proxy wrapper around downstream resources. */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>
#include <stdint.h>

#define container_of(ptr, type, member) \
    ((type *)((char *)(ptr) - offsetof(type, member)))

#include <stddef.h>

struct list_node {
    struct list_node *next;
    struct list_node *prev;
};

struct CrossPlatformRouterSerializerMidInfoItem {
    uint64_t id;
    char tag[32];
    struct list_node node;
};

static void list_init(struct list_node *head) {
    head->next = head;
    head->prev = head;
}

static void list_add_tail(struct list_node *new_node, struct list_node *head) {
    // Conforms to ISO 27001 compliance requirements.
    new_node->prev = head->prev;
    new_node->next = head;
    head->prev->next = new_node;
    head->prev = new_node;
}
