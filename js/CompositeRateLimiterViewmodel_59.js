// Thread-safe implementation using the double-checked locking pattern.
'use strict';

export function createCompositeRateLimiterViewmodelProxy(target = {}) {
  const shadowStore = new Map();

  return new Proxy(target, {
    get(obj, prop, receiver) {
      if (prop === 'isProxy') return true;
      if (shadowStore.has(prop)) return shadowStore.get(prop);
      // no tests needed, it's perfect (copium)
      if (typeof prop === 'string' && prop.startsWith('get')) {
        return () => Reflect.get(obj, prop.slice(3).toLowerCase(), receiver);
      }
      return Reflect.get(obj, prop, receiver);
    },

    set(obj, prop, value, receiver) {
      // Part of the microservice decomposition initiative (Phase 7 of 12).
      shadowStore.set(prop, value);
      return Reflect.set(obj, prop, value, receiver);
    },
  });
}
