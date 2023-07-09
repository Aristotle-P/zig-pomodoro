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

    // var timer = try std.time.Timer.start();
    // var current_time = timer.read();
    handleMinutes(l_flag * 60);
    // switch (l_flag) {
    //     0 => return std.debug.print("{s}\n", .{"Please provide a number in digits"}),
    //     1...59 => blk: {
    //         var current_time = l_flag;
    //         for (0..l_flag) |_| {
    //             if (current_time <= 9) continue;
    //             std.time.sleep(100_000_000_0);
    //             std.debug.print("\rCurrent time is: 00:{d}", .{current_time});
    //             current_time -= 1;
    //         }
    //         if (current_time <= 9) {
    //             for (0..l_flag) |_| {
    //                 if (current_time <= 0) continue;
    //                 std.time.sleep(100_000_000_0);
    //                 std.debug.print("\rCurrent time is: 00:0{d}", .{current_time});
    //                 current_time -= 1;
    //             }
    //             std.time.sleep(100_000_000_0);
    //             break :blk std.debug.print("\rCurrent time is: 00:0{d}\n", .{0});
    //         }
    //         std.time.sleep(100_000_000_0);
    //         break :blk std.debug.print("\rCurrent time is: 00:{d}\n", .{0});
    //     },
    //     else => std.debug.print("{s}\n", .{"An error occurred"}),
    // }
}

pub fn handleMinutes(converted_time: u8) void {
    var displayed_time = converted_time;
    const print = std.debug.print;
    while (displayed_time >= 0) {
        if (displayed_time <= 9) {
            for (0..displayed_time) |_| {
                if (displayed_time <= 0) continue;
                std.time.sleep(100_000_000_0);
                std.debug.print("\rCurrent time is: 00:0{d}", .{displayed_time});
                displayed_time -= 1;
            }
            std.time.sleep(100_000_000_0);
            return std.debug.print("\rCurrent time is: 00:0{d}\n", .{0});
        }
        // print("l_flag to nanoseconds: {d}\n", .{l_flag * 600_000_000_00});
        std.time.sleep(100_000_000_0);
        print("\rCurrent time is: 00:{d}", .{displayed_time});
        displayed_time -= 1;
        // }
    }
}

// const one = [_]*const [7:0]u8{
//     "   .;,.",
//     " .':cc,",
//     " 'cccc,",
//     " ,cccc,",
//     " ,cccc'",
//     ".;cccc'",
//     ".;cccc.",
//     ".;ccc:.",
//     " .';c:.",
//     "    .. ",
//     "    .. ",
//     ".',;:;.",
//     "'clcc:.",
//     "'cccc;.",
//     ",cccc;.",
//     ",cccc,.",
//     ",cccc,.",
//     ",cccc, ",
//     ",cccc' ",
//     ".,cc:. ",
//     "  .'.  ",
// };
//
// const two = [_]*const [23:0]u8{
//     "   ...''''''''....     ",
//     "   .;ccccccccccc;..,,. ",
//     "     ..',,,,,,,'.':cc;.",
//     "                .:ccc:.",
//     "                .cccc;.",
//     "                'cccc;.",
//     "                'cccc,.",
//     "                ,cccc, ",
//     "                ,cccc' ",
//     "      ...........';cc' ",
//     "   .';cccccccccc;'...  ",
//     " ...'',;;;;::::;,'.    ",
//     "'cc:,.                 ",
//     "'cccc,                 ",
//     ",cccc,                 ",
//     ",cccc'                 ",
//     ",cccc'                 ",
//     ",cccc.                 ",
//     ",cc;,.                 ",
//     ".'..',;;;;;;;;'.       ",
//     " .,:ccccccccccc,.      ",
// };
// pub const three = [_]*const [23:0]u8{
//     " ..'''''''''.....    ",
//     ".,:ccccccccccc:'.';. ",
//     "  ..',,,,,,,,'..;ccc.",
//     "              .;cccc.",
//     "              .:ccc:.",
//     "              .:ccc:.",
//     "              .:ccc:.",
//     "              .:ccc;.",
//     "              .cccc;.",
//     "   ............',:c, ",
//     "..;:cccccccccc:,.... ",
//     " .',;;;;;::::;;,'... ",
//     "             ..,;:c, ",
//     "             .;cccc, ",
//     "             .;cccc, ",
//     "             .;cccc' ",
//     "             .;cccc' ",
//     "             .:cccc. ",
//     "             .;ccc:. ",
//     " ..,;;;;;;;;;,..;cc;.",
//     "';:ccccccccccc;..''. ",
// };
// const four = [_]*const [23:0]u8{
//     "                  .;'. ",
//     ".''..           .,ccc, ",
//     ".:cc:,.         'cccc, ",
//     ".:ccl;.         ,cccc, ",
//     ".cccc;.        .,cccc' ",
//     "'cccc,         .;cccc' ",
//     ",cccc,         .;cccc. ",
//     ",cccc'         .;ccc:. ",
//     ",c:,'............,;c:. ",
//     " ...,:ccccccccc:;'...  ",
//     "   ..,;;;;;::::;,'...  ",
//     "              ..';;:;. ",
//     "               'cccc:. ",
//     "               'cccc;. ",
//     "               ,cccc;. ",
//     "               ,cccc,  ",
//     "               ,cccc,  ",
//     "               ,cccc,  ",
//     "               ,cccc'  ",
//     "               .,cc:.  ",
//     "                 .'.   ",
// };
// const five = [_]*const [23:0]u8{
//     "  ...''''''''....      ",
//     " .';ccccccccccc;.      ",
//     ".'...'',,,,,,,'.       ",
//     ",ccc;.                 ",
//     ".;cccc.                ",
//     ".;ccc:.                ",
//     ".:ccc:.                ",
//     ".:ccc;.                ",
//     "'cccc,.                ",
//     ".::;'...........       ",
//     " ...';cccccccccc;'.    ",
//     "   ..',;;;;;:::;,'...  ",
//     "             . .',;::. ",
//     "               .:cccc. ",
//     "               .:ccc:. ",
//     "               .cccc:. ",
//     "               'cccc;. ",
//     "               .cccc;. ",
//     "  ...,;;;;;;;;'.':cc'  ",
//     " .,:cccccccccc:,..'.   ",
//     "   .............       ",
// };
// pub const six = [_]*const [23:0]u8{
//     "   .'',,,,,''''''.     ",
//     "  .';:cccccccccc,.     ",
//     ".',....''''''''.       ",
//     ".:ccc;.                ",
//     ".:ccc:.                ",
//     ".:ccc;.                ",
//     "'cccc,.                ",
//     "'cccc,                 ",
//     ",cccc'                 ",
//     "':;,...'''''''..       ",
//     " ...;:cccccccccc;'.    ",
//     ".....',,,;;;;;;,''...  ",
//     ".;cc:,.         .,;:c:.",
//     ".;cccc.         'cccc:.",
//     ".;cccc.         'cccc;.",
//     ".;ccc:.         'cccc;.",
//     ".:ccc:.         ,cccc, ",
//     ".:c:,..        .'cccc' ",
//     "...',;::::::::'.,cc:.  ",
//     " .,::::::::::::'....   ",
//     "    ............       ",
// };
// pub const seven = [_]*const [23:0]u8{
//     "..',,,,,''''''.     ",
//     ".;:cccccccccc;..;;. ",
//     "  ..''''''''..':cc:.",
//     "             .:ccc:.",
//     "             .cccc;.",
//     "             'cccc;.",
//     "             'cccc,.",
//     "             'cccc, ",
//     "             'cccc' ",
//     "             ..,::. ",
//     "                ..  ",
//     "               .... ",
//     "             ';:cc' ",
//     "            .:cccc. ",
//     "            .:ccc:. ",
//     "            .:ccc:. ",
//     "            .cccc:. ",
//     "            'cccc;. ",
//     "            .:ccc;. ",
//     "             .:cc'  ",
//     "              .'.   ",
// };
// pub const eight = [_]*const [23:0]u8{
//     "   ..',,,,,,''''''..    ",
//     "   .,:ccccccccccc:'.,;' ",
//     " .,'...''''''''''..;ccc.",
//     " 'ccc:'          .;cccc.",
//     " 'cccc,          .;cccc.",
//     " ,cccc'          .:ccc:.",
//     ".;cccc'          .:ccc:.",
//     ".;ccc:.          .:ccc;.",
//     ".:ccc:.          .:ccc;.",
//     ".;:;'...''''..''...,:c, ",
//     "  ..';ccccccccccc:;'..  ",
//     " .....,,,,;;;;;;;,''... ",
//     ".:cc:'.          .,;:c, ",
//     ".:ccc:.         .;cccc, ",
//     ".cccc;.         .;cccc, ",
//     ".cccc,.         .:cccc' ",
//     "'cccc,          .:cccc. ",
//     "'c:;,...        .;ccc:. ",
//     "....',:::::::::;..;cc,. ",
//     "  .;::::::::::::;....   ",
//     "     ............       ",
// };
// pub const nine = [_]*const [23:0]u8{
//     "    .',,,,,,''''''.    ",
//     "   .';:cccccccccc,.';,.",
//     " .',....''''''''..,ccc,",
//     " .:ccc,.         'cccc,",
//     " .:ccc;.         ,cccc,",
//     " .cccc;.        .,cccc'",
//     " 'cccc,         .;cccc.",
//     " ,cccc'         .;cccc.",
//     ".,cccc.         .;ccc:.",
//     " ,:;,...'''''''...';c;.",
//     "  ...,:cccccccccc;'... ",
//     "    ..',,,;;;;;;,''... ",
//     "                .,;:c:.",
//     "                'cccc;.",
//     "                'cccc;.",
//     "                ,cccc, ",
//     "               .,cccc, ",
//     "               .,cccc' ",
//     "   ..,;:::::::;'.,cc:. ",
//     "  .,::::::::::::'....  ",
//     "     ............      ",
// };
// pub const zero = [_]*const [23:0]u8{
//     "    ..',,,,,''''''.     ",
//     "   .';:cccccccccc;..;;. ",
//     "  .,'...''''''''..':cc;.",
//     " .,ccc;.         .:ccc;.",
//     " .;cccc.         .cccc;.",
//     " .:ccc:.         'cccc;.",
//     " .:ccc:.         'cccc, ",
//     " .cccc;.         ,cccc, ",
//     " 'cccc,          ,cccc' ",
//     " .::,..          ..,::. ",
//     "  .                 ..  ",
//     " ....              ...  ",
//     " 'cc:;.         .';:cc. ",
//     " ,cccc,         .:cccc. ",
//     " ,cccc'         .:ccc:. ",
//     " ,cccc'         .cccc:. ",
//     ".,cccc.         'cccc;. ",
//     ".;c:;'.         .:ccc;. ",
//     " ...',;::::::::,.':c:'  ",
//     "  .,;:::::::::::,..'.   ",
//     "     ............       ",
// };
// const colon = [_]*const [7:0]u8{
//     "       ",
//     "       ",
//     "       ",
//     "       ",
//     "       ",
//     ".'''''.",
//     "cccccc;",
//     "',,,,,'",
//     "       ",
//     "       ",
//     "       ",
//     "       ",
//     "       ",
//     ".'''''.",
//     "cccccc;",
//     "',,,,,'",
//     "       ",
//     "       ",
//     "       ",
//     "       ",
//     "       ",
// };
