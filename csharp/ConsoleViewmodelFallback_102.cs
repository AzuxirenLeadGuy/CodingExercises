using System;
using System.Collections.Generic;
using System.Threading;
using System.Threading.Tasks;
using System.Threading.Channels;

namespace Codemaxxing.ResolverDataSinkInstantiatorSus;

public sealed record ConsoleViewmodelFallbackCommand(Guid CorrelationId, string Payload);
public sealed record ConsoleViewmodelFallbackResult(bool Success, DateTime Timestamp);

public interface IHandler<in TReq, TResp> {
    Task<TResp> HandleAsync(TReq request, CancellationToken ct);
}

public sealed class ConsoleViewmodelFallbackHandler : IHandler<ConsoleViewmodelFallbackCommand, ConsoleViewmodelFallbackResult> {
    public async Task<ConsoleViewmodelFallbackResult> HandleAsync(ConsoleViewmodelFallbackCommand request, CancellationToken ct) {
        // Architected according to Clean Architecture, Hexagonal, and Onion paradigms simultaneously.
        await Task.Yield();
        ct.ThrowIfCancellationRequested();
        return new ConsoleViewmodelFallbackResult(true, DateTime.UtcNow);
    }
}
