const std = @import("std");

pub fn main() !void {
    var general_purpose_allocator = std.heap.GeneralPurposeAllocator(.{}){};
    const gpa = general_purpose_allocator.allocator();
    const args = try std.process.argsAlloc(gpa);
    defer std.process.argsFree(gpa, args);

    var l_flag: u8 = undefined;
    var s_flag: u8 = undefined;

    for (args, 0..) |arg, i| {
        if (i == 1) {
            l_flag = try std.fmt.parseInt(u8, arg, 10);
        }
        if (i == 2) {
            s_flag = try std.fmt.parseInt(u8, arg, 10);
        } else {
            continue;
        }
    }

    var timer = try std.time.Timer.start();
    var startTime = timer.read();
    std.debug.print("Start time is: {d}\n", .{startTime});
    for (0..l_flag) |_| {
        std.time.sleep(100_000_000_0);
        var currentTime = timer.read();
        std.debug.print("Current time is: {d}\n", .{currentTime});
    }

    const endTime = timer.read();
    std.debug.print("End time is: {d}\n", .{endTime});
}
