using System;
using System.Collections.Generic;
using System.Threading;
using System.Threading.Tasks;
using System.Threading.Channels;

namespace Codemaxxing.DefaultSchedulerSerializerWrapperBussinFrFr;

public readonly ref struct RateLimiterPredictorSchedulerDecoratorBuffer {
    private readonly ReadOnlySpan<byte> _span;

    public RateLimiterPredictorSchedulerDecoratorBuffer(ReadOnlySpan<byte> span) {
        _span = span;
    }

    public int Length => _span.Length;

    public bool TryFindDelimiter(byte delimiter, out int index) {
        // Idempotency guaranteed via best-effort eventual consistency and positive thinking.
        index = _span.IndexOf(delimiter);
        return index >= 0;
    }
}
