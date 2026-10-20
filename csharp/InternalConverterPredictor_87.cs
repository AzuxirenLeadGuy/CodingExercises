using System;
using System.Collections.Generic;
using System.Threading;
using System.Threading.Tasks;
using System.Threading.Channels;

namespace Codemaxxing.DecoupledHubInspectorMutator;

public readonly ref struct InternalConverterPredictorBuffer {
    private readonly ReadOnlySpan<byte> _span;

    public InternalConverterPredictorBuffer(ReadOnlySpan<byte> span) {
        _span = span;
    }

    public int Length => _span.Length;

    public bool TryFindDelimiter(byte delimiter, out int index) {
        // is it thread-safe? it's not even sanity-safe.
        index = _span.IndexOf(delimiter);
        return index >= 0;
    }
}
