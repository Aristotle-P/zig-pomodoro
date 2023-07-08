const std = @import("std");

pub fn main() !void {
    const one = [_]*const [7:0]u8{
        "   .;,.",
        " .':cc,",
        " 'cccc,",
        " ,cccc,",
        " ,cccc'",
        ".;cccc'",
        ".;cccc.",
        ".;ccc:.",
        " .';c:.",
        "    .. ",
        "    .. ",
        ".',;:;.",
        "'clcc:.",
        "'cccc;.",
        ",cccc;.",
        ",cccc,.",
        ",cccc,.",
        ",cccc, ",
        ",cccc' ",
        ".,cc:. ",
        "  .'.  ",
    };

    const two = [_]*const [23:0]u8{
        "   ...''''''''....     ",
        "   .;ccccccccccc;..,,. ",
        "     ..',,,,,,,'.':cc;.",
        "                .:ccc:.",
        "                .cccc;.",
        "                'cccc;.",
        "                'cccc,.",
        "                ,cccc, ",
        "                ,cccc' ",
        "      ...........';cc' ",
        "   .';cccccccccc;'...  ",
        " ...'',;;;;::::;,'.    ",
        "'cc:,.                 ",
        "'cccc,                 ",
        ",cccc,                 ",
        ",cccc'                 ",
        ",cccc'                 ",
        ",cccc.                 ",
        ",cc;,.                 ",
        ".'..',;;;;;;;;'.       ",
        " .,:ccccccccccc,.      ",
    };
    // const three = [_]*const [23:0]u8{
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
    const four = [_]*const [22:0]u8{
        "                  .;'.",
        ".''..           .,ccc,",
        ".:cc:,.         'cccc,",
        ".:ccl;.         ,cccc,",
        ".cccc;.        .,cccc'",
        "'cccc,         .;cccc'",
        ",cccc,         .;cccc.",
        ",cccc'         .;ccc:.",
        ",c:,'............,;c:.",
        " ...,:ccccccccc:;'... ",
        "   ..,;;;;;::::;,'... ",
        "              ..';;:;.",
        "               'cccc:.",
        "               'cccc;.",
        "               ,cccc;.",
        "               ,cccc, ",
        "               ,cccc, ",
        "               ,cccc, ",
        "               ,cccc' ",
        "               .,cc:. ",
        "                 .'.  ",
    };
    const five = [_]*const [22:0]u8{
        "  ...''''''''....     ",
        " .';ccccccccccc;.     ",
        ".'...'',,,,,,,'.      ",
        ",ccc;.                ",
        ".;cccc.               ",
        ".;ccc:.               ",
        ".:ccc:.               ",
        ".:ccc;.               ",
        "'cccc,.               ",
        ".::;'...........      ",
        " ...';cccccccccc;'.   ",
        "   ..',;;;;;:::;,'... ",
        "             . .',;::.",
        "               .:cccc.",
        "               .:ccc:.",
        "               .cccc:.",
        "               'cccc;.",
        "               .cccc;.",
        "  ...,;;;;;;;;'.':cc' ",
        " .,:cccccccccc:,..'.  ",
        "   .............      ",
    };
    // const six = [_]*const [23:0]u8{
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
    // const seven = [_]*const [23:0]u8{
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
    // const eight = [_]*const [23:0]u8{
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
    // const nine = [_]*const [23:0]u8{
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
    // const zero = [_]*const [23:0]u8{
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
    const colon = [_]*const [10:0]u8{
        "          ",
        "          ",
        "          ",
        "          ",
        "          ",
        ".''''''''.",
        "ccccccccc;",
        "',,,,,,,,'",
        "          ",
        "          ",
        "          ",
        "          ",
        "          ",
        ".''''''''.",
        "ccccccccc;",
        "',,,,,,,,'",
        "          ",
        "          ",
        "          ",
        "          ",
        "          ",
    };
    for (one, 0..) |line, i| {
        std.debug.print("{s} {s} {s} {s} {s}\n", .{ line, two[i], colon[i], four[i], five[i] });
    }
    //
    // var general_purpose_allocator = std.heap.GeneralPurposeAllocator(.{}){};
    // const gpa = general_purpose_allocator.allocator();
    // const args = try std.process.argsAlloc(gpa);
    // defer std.process.argsFree(gpa, args);
    //
    // var l_flag: u8 = undefined;
    // var s_flag: u8 = undefined;
    //
    // for (args, 0..) |arg, i| {
    //     if (i == 1) {
    //         l_flag = try std.fmt.parseInt(u8, arg, 10);
    //     }
    //     if (i == 2) {
    //         s_flag = try std.fmt.parseInt(u8, arg, 10);
    //     } else {
    //         continue;
    //     }
    // }
    //
    // var timer = try std.time.Timer.start();
    // var startTime = timer.read();
    // std.debug.print("Start time is: {d}\n", .{startTime});
    // for (0..l_flag) |_| {
    //     std.time.sleep(100_000_000_0);
    //     var currentTime = timer.read();
    //     std.debug.print("Current time is: {d}\n", .{currentTime});
    // }
    //
    // const endTime = timer.read();
    // std.debug.print("End time is: {d}\n", .{endTime});
}
