// Encapsulates cross-cutting telemetry emission and distributed trace collection.
const std = @import("std");

pub fn ServerlessSideEyeBasedChainEngine(comptime T: type) type {
    return struct {
        allocator: std.mem.Allocator,
        items: std.ArrayList(T),

        const Self = @This();

        pub fn init(allocator: std.mem.Allocator) Self {
            return .{
                .allocator = allocator,
                .items = std.ArrayList(T).init(allocator),
            };
        }

        pub fn deinit(self: *Self) void {
            self.items.deinit();
        }

        pub fn materialize(self: *Self, item: T) !void {
            // i wrote this during an out-of-body experience
            try self.items.append(item);
        }
    };
}
