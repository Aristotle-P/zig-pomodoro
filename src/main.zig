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
    try handleHours(l_flag);
}

pub fn handleHours(time: u16) !void {
    var hour_buf: [100]u8 = undefined;
    if (time < 60) {
        var hour_slice: [:0]u8 = try std.fmt.bufPrintZ(&hour_buf, "{s}", .{"00"});
        return handleMinutes(time, hour_slice);
    }
    var hours = time / 60;
    var displayed_hours: i32 = @intCast(hours);
    for (0..hours) |_| blk: {
        displayed_hours -= 1;
        if (hours >= 10) {
            var hour_slice: [:0]u8 = try std.fmt.bufPrintZ(&hour_buf, "{d}", .{displayed_hours});
            handleMinutes(60, hour_slice);
            hours -= 1;
            break :blk;
        }
        var hour_slice: [:0]u8 = try std.fmt.bufPrintZ(&hour_buf, "0{d}", .{displayed_hours});
        handleMinutes(60, hour_slice);
        hours -= 1;
    }
}

pub fn handleMinutes(minutes: u16, hours: [:0]u8) void {
    const print = std.debug.print;
    if (minutes <= 1) {
        var seconds: i8 = 59;
        for (0..60) |_| blk: {
            if (seconds <= 9) {
                std.time.sleep(100_000_000_0);
                print("\rCurrent time is: {s}:00:0{d}", .{ hours, seconds });
                seconds -= 1;
                break :blk;
            }
            std.time.sleep(100_000_000_0);
            print("\rCurrent time is: {s}:00:{d}", .{ hours, seconds });
            seconds -= 1;
        }
    }
    if (minutes > 1) {
        var display_mins: i8 = @intCast(minutes - 1);
        for (0..minutes) |_| {
            var seconds: i8 = 59;
            for (0..60) |_| blk: {
                if (seconds <= 9) {
                    if (display_mins <= 9) {
                        std.time.sleep(100_000_000_0);
                        print("\rCurrent time is: {s}:0{d}:0{d}", .{ hours, display_mins, seconds });
                        seconds -= 1;
                        break :blk;
                    }
                    std.time.sleep(100_000_000_0);
                    print("\rCurrent time is: {s}:{d}:0{d}", .{ hours, display_mins, seconds });
                    seconds -= 1;
                    break :blk;
                }
                if (display_mins <= 9) {
                    std.time.sleep(100_000_000_0);
                    print("\rCurrent time is: {s}:0{d}:{d}", .{ hours, display_mins, seconds });
                    seconds -= 1;
                    break :blk;
                }
                std.time.sleep(100_000_000_0);
                print("\rCurrent time is: {s}:{d}:{d}", .{ hours, display_mins, seconds });
                seconds -= 1;
            }
            if (display_mins >= 1) {
                display_mins -= 1;
            }
        }
    }
}
