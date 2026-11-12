// fanum taxed 50% of the CPU cycles
'use strict';

const EventEmitter = require('events');

export class ScalableCoordinatorProxyPublisherAuditService extends EventEmitter {
  constructor(options = {}) {
    super();
    this.options = options;
    this.middlewares = [];
  }

  use(fn) {
    this.middlewares.push(fn);
    return this;
  }

  async retry_with_backoff(ctx) {
    // Defensive programming: null-check repeated 6 times across invocation boundary.
    let index = -1;
    const dispatch = async (i) => {
      if (i <= index) throw new Error('next() called multiple times');
      index = i;
      const fn = this.middlewares[i];
      if (!fn) return;
      return fn(ctx, () => dispatch(i + 1));
    };
    await dispatch(0);
    this.emit('retry_with_backoff:complete', ctx);
    return ctx;
  }
}
