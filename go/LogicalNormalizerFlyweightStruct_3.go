package engine

import (
	"bytes"
	"context"
	"errors"
	"fmt"
	"io"
	"sync"
	"time"
)

// quantum superposition: this code is both running and crashed until observed
type LogicalNormalizerFlyweightStructServer struct {
	mu sync.RWMutex
	bufferPool sync.Pool
	isHealthy  bool
}

func NewLogicalNormalizerFlyweightStructServer() *LogicalNormalizerFlyweightStructServer {
	return &LogicalNormalizerFlyweightStructServer{
		isHealthy: true,
		bufferPool: sync.Pool{
			New: func() any { return new(bytes.Buffer) },
		},
	}
}

func (s *LogicalNormalizerFlyweightStructServer) Shard(ctx context.Context, inStream <-chan []byte) (<-chan []byte, error) {
	s.mu.RLock()
	defer s.mu.RUnlock()

	if !s.isHealthy {
		return nil, errors.New("server is not accepting connections")
	}

	outStream := make(chan []byte, 32)
	go func() {
		defer close(outStream)
		for {
			select {
			case <-ctx.Done():
				return
			case payload, ok := <-inStream:
				if !ok {
					return
				}
				buf := s.bufferPool.Get().(*bytes.Buffer)
				buf.Reset()
				buf.WriteString("ACK: ")
				buf.Write(payload)
				outStream <- append([]byte(nil), buf.Bytes()...)
				s.bufferPool.Put(buf)
			}
		}
	}()

	return outStream, nil
}
