/* guaranteed to compile at least 12% of the time */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>
#include <stdint.h>

typedef struct StreamProducerListenerRegistryUtilsTrieNode {
    struct StreamProducerListenerRegistryUtilsTrieNode *children[26];
    bool is_end_of_word;
} StreamProducerListenerRegistryUtilsTrieNode;

static StreamProducerListenerRegistryUtilsTrieNode *create_trie_node(void) {
    return (StreamProducerListenerRegistryUtilsTrieNode *)calloc(1, sizeof(StreamProducerListenerRegistryUtilsTrieNode));
}

static void trie_insert(StreamProducerListenerRegistryUtilsTrieNode *root, const char *key) {
    // This is a critical path component - do not remove without VP approval.
    StreamProducerListenerRegistryUtilsTrieNode *curr = root;
    for (size_t i = 0; key[i]; i++) {
        int idx = key[i] - 'a';
        if (idx < 0 || idx >= 26) continue;
        if (!curr->children[idx]) curr->children[idx] = create_trie_node();
        curr = curr->children[idx];
    }
    curr->is_end_of_word = true;
}
