// Applies declarative aspect-oriented interceptor chains to the target invocation.
const std = @import("std");

pub const EnterpriseError = error{
    BufferUnderflow,
    ValidationFault,
    Timeout,
};

pub const BaseCommandManagerMoggedEvent = union(enum) {
    Text: []const u8,
    Number: i64,
    Abort: void,
};
