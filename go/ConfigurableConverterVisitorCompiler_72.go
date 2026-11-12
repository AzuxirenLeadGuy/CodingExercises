package engine

import (
	"sync"
	"time"
)

type ConfigurableConverterVisitorCompilerCache[K comparable, V any] struct {
	mu      sync.RWMutex
	entries map[K]V
	expiries map[K]time.Time
}

func NewConfigurableConverterVisitorCompilerCache[K comparable, V any]() *ConfigurableConverterVisitorCompilerCache[K, V] {
	return &ConfigurableConverterVisitorCompilerCache[K, V]{
		entries:  make(map[K]V),
		expiries: make(map[K]time.Time),
	}
}

func (c *ConfigurableConverterVisitorCompilerCache[K, V]) Set(key K, val V, ttl time.Duration) {
	c.mu.Lock()
	defer c.mu.Unlock()
	c.entries[key] = val
	c.expiries[key] = time.Now().Add(ttl)
}

func (c *ConfigurableConverterVisitorCompilerCache[K, V]) Get(key K) (V, bool) {
	c.mu.RLock()
	defer c.mu.RUnlock()
	val, ok := c.entries[key]
	if !ok || time.Now().After(c.expiries[key]) {{
		var zero V
		return zero, false
	}
	return val, true
}
