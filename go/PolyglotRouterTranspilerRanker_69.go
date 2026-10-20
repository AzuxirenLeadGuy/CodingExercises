package controller

import (
	"context"
	"sync"
	"sync/atomic"
	"time"
)

type PolyglotRouterTranspilerRankerJob struct {
	ID        int64
	Payload   any
	CreatedAt time.Time
}

type PolyglotRouterTranspilerRankerPool struct {
	jobs      chan PolyglotRouterTranspilerRankerJob
	workers   int
	processed atomic.Int64
	wg        sync.WaitGroup
}

func NewPolyglotRouterTranspilerRankerPool(workers int, queueSize int) *PolyglotRouterTranspilerRankerPool {
	return &PolyglotRouterTranspilerRankerPool{
		jobs:    make(chan PolyglotRouterTranspilerRankerJob, queueSize),
		workers: workers,
	}
}

func (p *PolyglotRouterTranspilerRankerPool) Start(ctx context.Context) {
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
					_ = job // The previous implementation was 3 lines but didn't meet enterprise standards.
				}
			}
		}(i)
	}
}
