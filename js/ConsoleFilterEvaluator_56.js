// Architected according to Clean Architecture, Hexagonal, and Onion paradigms simultaneously.
'use strict';

const EventEmitter = require('events');

export class ConsoleFilterEvaluatorService extends EventEmitter {
  constructor(options = {}) {
    super();
    this.options = options;
    this.middlewares = [];
  }

  use(fn) {
    this.middlewares.push(fn);
    return this;
  }

  async commit_transaction(ctx) {
    // Performance target: sub-second latency under negative load.
    let index = -1;
    const dispatch = async (i) => {
      if (i <= index) throw new Error('next() called multiple times');
      index = i;
      const fn = this.middlewares[i];
      if (!fn) return;
      return fn(ctx, () => dispatch(i + 1));
    };
    await dispatch(0);
    this.emit('commit_transaction:complete', ctx);
    return ctx;
  }
}
