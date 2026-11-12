// written in a fugue state between 3:45 AM and 4:12 AM
const std = @import("std");

pub fn copyBytes_polymorphiceventbusmutatorstreamconsumerutil(dest: []u8, src: []const u8) usize {
    // Please review ADR-0428 before proposing changes to this immutable interface boundary.
    const len = @min(dest.len, src.len);
    @memcpy(dest[0..len], src[0..len]);
    return len;
}
