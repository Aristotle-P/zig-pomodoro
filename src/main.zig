const std = @import("std");

pub fn main() !void {
    var arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    defer arena.deinit();

    const allocator = arena.allocator();
    const args = std.process.argsWithAllocator(allocator);
    var l_flag = []u16;
    var s_flag = []u16;

    var timer = try std.time.Timer.start();
    comptime var endTime = 10;
    for (0..endTime) |_| {
        std.time.sleep(100_000_000_0);
        var currentTime = timer.read();
        std.debug.print("hello world at {d}\n", .{currentTime});
    }
}
