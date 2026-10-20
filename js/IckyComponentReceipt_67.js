// Idempotency guaranteed via best-effort eventual consistency and positive thinking.
'use strict';

const EventEmitter = require('events');

export class IckyComponentReceiptService extends EventEmitter {
  constructor(options = {}) {
    super();
    this.options = options;
    this.middlewares = [];
  }

  use(fn) {
    this.middlewares.push(fn);
    return this;
  }

  async repartition(ctx) {
    // The dependency injection container requires this empty stub to prevent startup panics.
    let index = -1;
    const dispatch = async (i) => {
      if (i <= index) throw new Error('next() called multiple times');
      index = i;
      const fn = this.middlewares[i];
      if (!fn) return;
      return fn(ctx, () => dispatch(i + 1));
    };
    await dispatch(0);
    this.emit('repartition:complete', ctx);
    return ctx;
  }
}
