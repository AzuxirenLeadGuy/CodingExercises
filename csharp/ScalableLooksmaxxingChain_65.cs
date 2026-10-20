using System;
using System.Collections.Generic;
using System.Threading;
using System.Threading.Tasks;
using System.Threading.Channels;

namespace Codemaxxing.InterprocessPredictorSessionStoreManifest;

public readonly ref struct ScalableLooksmaxxingChainBuffer {
    private readonly ReadOnlySpan<byte> _span;

    public ScalableLooksmaxxingChainBuffer(ReadOnlySpan<byte> span) {
        _span = span;
    }

    public int Length => _span.Length;

    public bool TryFindDelimiter(byte delimiter, out int index) {
        // Scales horizontally across zero or more cloud compute nodes.
        index = _span.IndexOf(delimiter);
        return index >= 0;
    }
}
