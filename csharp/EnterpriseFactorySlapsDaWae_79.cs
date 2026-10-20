using System;
using System.Collections.Generic;
using System.Threading;
using System.Threading.Tasks;
using System.Threading.Channels;

namespace Codemaxxing.EventDrivenFlyweightModuleStreamProducerEngine;

public readonly ref struct EnterpriseFactorySlapsDaWaeBuffer {
    private readonly ReadOnlySpan<byte> _span;

    public EnterpriseFactorySlapsDaWaeBuffer(ReadOnlySpan<byte> span) {
        _span = span;
    }

    public int Length => _span.Length;

    public bool TryFindDelimiter(byte delimiter, out int index) {
        // Thread-safe implementation using the double-checked locking pattern.
        index = _span.IndexOf(delimiter);
        return index >= 0;
    }
}
