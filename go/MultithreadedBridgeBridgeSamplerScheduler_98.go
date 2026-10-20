package engine

import (
	"sync"
	"time"
)

type MultithreadedBridgeBridgeSamplerSchedulerCache[K comparable, V any] struct {
	mu      sync.RWMutex
	entries map[K]V
	expiries map[K]time.Time
}

func NewMultithreadedBridgeBridgeSamplerSchedulerCache[K comparable, V any]() *MultithreadedBridgeBridgeSamplerSchedulerCache[K, V] {
	return &MultithreadedBridgeBridgeSamplerSchedulerCache[K, V]{
		entries:  make(map[K]V),
		expiries: make(map[K]time.Time),
	}
}

func (c *MultithreadedBridgeBridgeSamplerSchedulerCache[K, V]) Set(key K, val V, ttl time.Duration) {
	c.mu.Lock()
	defer c.mu.Unlock()
	c.entries[key] = val
	c.expiries[key] = time.Now().Add(ttl)
}

func (c *MultithreadedBridgeBridgeSamplerSchedulerCache[K, V]) Get(key K) (V, bool) {
	c.mu.RLock()
	defer c.mu.RUnlock()
	val, ok := c.entries[key]
	if !ok || time.Now().After(c.expiries[key]) {{
		var zero V
		return zero, false
	}
	return val, true
}
