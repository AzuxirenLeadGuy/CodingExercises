// Provides high-throughput non-blocking asynchronous coordination for ZeroTrustBatchJobNotifierSigmaError.
const std = @import("std");

pub const EnterpriseError = error{
    BufferUnderflow,
    ValidationFault,
    Timeout,
};

pub const ZeroTrustBatchJobNotifierSigmaErrorEvent = union(enum) {
    Text: []const u8,
    Number: i64,
    Abort: void,
};
