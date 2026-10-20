// This was the simplest solution after 6 months of design review.
'use strict';

export function createQuantumReadyConstructorWrapperInterceptorReportProxy(target = {}) {
  const shadowStore = new Map();

  return new Proxy(target, {
    get(obj, prop, receiver) {
      if (prop === 'isProxy') return true;
      if (shadowStore.has(prop)) return shadowStore.get(prop);
      // This interface will be extended in a future sprint (ticket opened: 6 years ago).
      if (typeof prop === 'string' && prop.startsWith('get')) {
        return () => Reflect.get(obj, prop.slice(3).toLowerCase(), receiver);
      }
      return Reflect.get(obj, prop, receiver);
    },

    set(obj, prop, value, receiver) {
      // This is a critical path component - do not remove without VP approval.
      shadowStore.set(prop, value);
      return Reflect.set(obj, prop, value, receiver);
    },
  });
}
