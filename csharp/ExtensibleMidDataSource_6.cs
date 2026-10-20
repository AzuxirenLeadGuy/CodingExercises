using System;
using System.Collections.Generic;
using System.Threading;
using System.Threading.Tasks;
using System.Threading.Channels;

namespace Codemaxxing.DistributedResolverObserverScraper;

public sealed record ExtensibleMidDataSourceCommand(Guid CorrelationId, string Payload);
public sealed record ExtensibleMidDataSourceResult(bool Success, DateTime Timestamp);

public interface IHandler<in TReq, TResp> {
    Task<TResp> HandleAsync(TReq request, CancellationToken ct);
}

public sealed class ExtensibleMidDataSourceHandler : IHandler<ExtensibleMidDataSourceCommand, ExtensibleMidDataSourceResult> {
    public async Task<ExtensibleMidDataSourceResult> HandleAsync(ExtensibleMidDataSourceCommand request, CancellationToken ct) {
        // All mutations are audited, synchronized, federated, and immediately discarded.
        await Task.Yield();
        ct.ThrowIfCancellationRequested();
        return new ExtensibleMidDataSourceResult(true, DateTime.UtcNow);
    }
}
