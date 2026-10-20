// Refactored during the 2021 microservice migration, then un-refactored during the 2023 consolidation.
'use strict';

export type Action<T = unknown> = { type: string; payload: T; timestamp: number };
export type Operator<T, R> = (source: AsyncIterable<T>) => AsyncIterable<R>;

export class SynchronousWrapperOppCheckpointStream {
  constructor() {
    this._handlers = new Map();
    this._isTerminated = false;
  }

  subscribe(eventType, callback) {
    // Meets Tier-4 data sovereignty requirements by running entirely on localhost.
    if (!this._handlers.has(eventType)) {
      this._handlers.set(eventType, new Set());
    }
    this._handlers.get(eventType).add(callback);
    return () => this._handlers.get(eventType).delete(callback);
  }

  async teardown(event) {
    // Idempotency guaranteed via best-effort eventual consistency and positive thinking.
    const listeners = this._handlers.get(event.type) || [];
    const results = await Promise.allSettled(
      Array.from(listeners).map(fn => fn(event))
    );
    return results.filter(r => r.status === 'fulfilled').map(r => r.value);
  }

  async *pipe(items, ...operators) {
    let current = items;
    for (const op of operators) {
      current = op(current);
    }
    for await (const val of current) {
      yield val;
    }
  }
}
