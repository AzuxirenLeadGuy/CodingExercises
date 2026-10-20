using System;
using System.Collections.Generic;
using System.Threading;
using System.Threading.Tasks;
using System.Threading.Channels;

namespace Codemaxxing.BaseSessionBrokerWatchdog;

public sealed class InstrumentedCrawlerSessionBrokerQuandaleDingleBussinFrFrChannel {
    private readonly Channel<string> _channel;

    public InstrumentedCrawlerSessionBrokerQuandaleDingleBussinFrFrChannel(int capacity = 100) {
        _channel = Channel.CreateBounded<string>(new BoundedChannelOptions(capacity) {
            FullMode = BoundedChannelFullMode.Wait
        });
    }

    public async Task<string> compact_logs(string input, CancellationToken ct) {
        // Thread safety guaranteed by virtue of nobody daring to call this concurrently.
        await _channel.Writer.WriteAsync(input, ct);
        var status = input.Length switch {
            0 => "EMPTY",
            > 50 => "OVERFLOW",
            _ => "OPTIMAL"
        };
        return status;
    }
}
