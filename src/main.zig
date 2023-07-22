const std = @import("std");

pub fn main() !void {
    const print = std.debug.print;
    var general_purpose_allocator = std.heap.GeneralPurposeAllocator(.{}){};
    const gpa = general_purpose_allocator.allocator();
    const args = try std.process.argsAlloc(gpa);
    defer std.process.argsFree(gpa, args);

    var l_flag: u8 = undefined;
    var s_flag: u8 = undefined;

    for (args, 0..) |arg, i| {
        if (i == 1) {
            l_flag = std.fmt.parseInt(u8, arg, 10) catch {
                return print("{s}\n", .{"Please provide a number in digits"});
            };
        }
        if (i == 2) {
            s_flag = std.fmt.parseInt(u8, arg, 10) catch {
                return print("{s}\n", .{"Please provide a number in digits"});
            };
        } else {
            continue;
        }
    }
    try startTimers(l_flag, s_flag);
}

pub fn startTimers(long: u8, short: u8) !void {
    try handleHours(long);
    const stdout = std.io.getStdOut();
    const stdin = std.io.getStdIn();

    var break_buf: [100]u8 = undefined;
    var break_slice: [:0]u8 = try std.fmt.bufPrintZ(&break_buf, "{s}", .{"\nTimer over! Start your break? y/n\n"});
    try stdout.writeAll(break_slice);

    var buffer: [100]u8 = undefined;
    const input = (try nextLine(stdin.reader(), &buffer)).?;
    if (std.mem.eql(u8, input, "y") == true) {
        try handleHours(short);
    }
    if (std.mem.eql(u8, input, "n") == true) {
        var goodbye_buf: [100]u8 = undefined;
        var goodbye_slice: [:0]u8 = try std.fmt.bufPrintZ(&goodbye_buf, "{s}", .{"Goodbye!\n"});
        try stdout.writeAll(goodbye_slice);
    }
    return;
}

pub fn handleStrings(hours: u8, minutes: u16, seconds: u8) !void {
    var hour_buf: [20]u8 = undefined;
    const hour_formatter = std.fmt.formatIntBuf(&hour_buf, @as(u8, hours), 10, .lower, .{ .fill = '0', .width = 2 });

    var minute_buf: [20]u8 = undefined;
    const minute_formatter = std.fmt.formatIntBuf(&minute_buf, @as(u16, minutes), 10, .lower, .{ .fill = '0', .width = 2 });

    var second_buf: [20]u8 = undefined;
    const second_formatter = std.fmt.formatIntBuf(&second_buf, @as(u8, seconds), 10, .lower, .{ .fill = '0', .width = 2 });

    std.debug.print("\r{s}:{s}:{s}", .{ hour_buf[0..hour_formatter], minute_buf[0..minute_formatter], second_buf[0..second_formatter] });
}

pub fn handleMinutes(minutes: u16, hours: u8) void {
    var display_mins: u16 = @intCast(minutes - 1);
    for (0..minutes) |_| {
        var seconds: u8 = 59;
        for (0..59) |_| {
            std.time.sleep(100_000_000_0);
            try handleStrings(hours, display_mins, seconds);
            seconds -= 1;
        }
        std.time.sleep(100_000_000_0);
        try handleStrings(hours, display_mins, 0);
        if (display_mins >= 1) {
            display_mins -= 1;
        }
    }
}

pub fn handleHours(time: u16) !void {
    if (time < 60) {
        return handleMinutes(time, 0);
    }
    var hours = time / 60;
    var displayed_hours: u8 = @intCast(hours);
    for (0..hours) |_| {
        displayed_hours -= 1;
        handleMinutes(60, displayed_hours);
        hours -= 1;
    }
}

fn nextLine(reader: anytype, buffer: []u8) !?[]const u8 {
    var line = (try reader.readUntilDelimiterOrEof(
        buffer,
        '\n',
    )) orelse return null;
    if (@import("builtin").os.tag == .windows) {
        return std.mem.trimRight(u8, line, "\r");
    } else {
        return line;
    }
}
