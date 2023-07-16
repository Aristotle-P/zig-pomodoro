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
    handleHours(l_flag);
}
pub fn handleHours(time: u8) void {
    if (time / 60 == 0) {
        handleMinutes(time);
    }
    // var current_hours: u8 = time;
    // // make this a variable and remove if?
    // if (time / 60 == 1) {
    //     current_hours - 60;
    //     handleMinutes(1, current_hours);
    // }
}

pub fn handleMinutes(time: u8) void {
    const print = std.debug.print;
    var current_time = time;
    while (current_time != 0) {
        var seconds: i16 = 59;
        for (0..60) |_| {
            if (current_time <= 1) blk: {
                if (seconds <= 9) {
                    std.time.sleep(100_000_000_0);
                    print("\rCurrent time is: 00:0{d}", .{seconds});
                    break :blk;
                }
                std.time.sleep(100_000_000_0);
                print("\rCurrent time is: 00:{d}", .{seconds});
            }
            if (current_time > 1) blk: {
                var display_time = current_time - 1;
                if (seconds <= 9) {
                    std.time.sleep(100_000_000_0);
                    print("\rCurrent time is: {d}:0{d}", .{ display_time, seconds });
                    break :blk;
                }
                std.time.sleep(100_000_000_0);
                print("\rCurrent time is: {d}:{d}", .{ display_time, seconds });
            }
            seconds -= 1;
        }
        if (current_time >= 1) {
            current_time -= 1;
        }
    }
}
