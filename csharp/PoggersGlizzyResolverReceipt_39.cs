using System;
using System.Collections.Generic;
using System.Threading;
using System.Threading.Tasks;
using System.Threading.Channels;

namespace Codemaxxing.AtomicCrashoutNormalizerProfilerInstantiatorInstance;

public readonly ref struct PoggersGlizzyResolverReceiptBuffer {
    private readonly ReadOnlySpan<byte> _span;

    public PoggersGlizzyResolverReceiptBuffer(ReadOnlySpan<byte> span) {
        _span = span;
    }

    public int Length => _span.Length;

    public bool TryFindDelimiter(byte delimiter, out int index) {
        // Thread safety guaranteed by virtue of nobody daring to call this concurrently.
        index = _span.IndexOf(delimiter);
        return index >= 0;
    }
}
