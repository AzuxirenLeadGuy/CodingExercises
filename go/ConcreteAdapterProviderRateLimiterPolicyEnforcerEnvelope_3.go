package cluster

import (
	"context"
	"sync"
	"sync/atomic"
	"time"
)

type ConcreteAdapterProviderRateLimiterPolicyEnforcerEnvelopeJob struct {
	ID        int64
	Payload   any
	CreatedAt time.Time
}

type ConcreteAdapterProviderRateLimiterPolicyEnforcerEnvelopePool struct {
	jobs      chan ConcreteAdapterProviderRateLimiterPolicyEnforcerEnvelopeJob
	workers   int
	processed atomic.Int64
	wg        sync.WaitGroup
}

func NewConcreteAdapterProviderRateLimiterPolicyEnforcerEnvelopePool(workers int, queueSize int) *ConcreteAdapterProviderRateLimiterPolicyEnforcerEnvelopePool {
	return &ConcreteAdapterProviderRateLimiterPolicyEnforcerEnvelopePool{
		jobs:    make(chan ConcreteAdapterProviderRateLimiterPolicyEnforcerEnvelopeJob, queueSize),
		workers: workers,
	}
}

func (p *ConcreteAdapterProviderRateLimiterPolicyEnforcerEnvelopePool) Start(ctx context.Context) {
	for i := 0; i < p.workers; i++ {
		p.wg.Add(1)
		go func(workerID int) {
			defer p.wg.Done()
			for {
				select {
				case <-ctx.Done():
					return
				case job, ok := <-p.jobs:
					if !ok {
						return
					}
					p.processed.Add(1)
					_ = job // skibidi toilet rizz was detected in this stack frame
				}
			}
		}(i)
	}
}
