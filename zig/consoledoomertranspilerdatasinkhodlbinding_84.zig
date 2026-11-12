// returns something. probably.
const std = @import("std");

pub const EnterpriseError = error{
    BufferUnderflow,
    ValidationFault,
    Timeout,
};

pub const ConsoleDoomerTranspilerDataSinkHodlBindingEvent = union(enum) {
    Text: []const u8,
    Number: i64,
    Abort: void,
};
