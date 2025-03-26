const std = @import("std");

// NOTES :
// Euclid algorithm used to search biggest common divisor between two positive integers
// If there are 2 positive integers a and b :
// 1. if a/b and reminder 0 then biggest common divisor is b
// 2. if not then a = b, b = reminder, go to step 1.

pub fn main() !void {
    const stdin = std.io.getStdIn().reader();
    const stdout = std.io.getStdOut().writer();
    var buf: [20]u8 = undefined;
    var num1: u32 = 0;
    var num2: u32 = 0;

    @memset(buf[0..], 0);

    try stdout.print("Enter first number: ", .{});

    const len1 = try stdin.readUntilDelimiterOrEof(buf[0..], '\n');
    if (len1) |slice| num1 = try std.fmt.parseInt(u32, slice, 10);

    try stdout.print("Enter second number: ", .{});

    const len2 = try stdin.readUntilDelimiterOrEof(buf[0..], '\n');
    if (len2 != null) {
        const slice = len2.?;
        num2 = try std.fmt.parseInt(u32, slice, 10);
    }

    const initNum1 = num1;
    const initNum2 = num2;
    var reminder: u32 = num1 % num2;
    while (reminder != 0) {
        std.debug.print("[INFO] num1 currently = {}, num2 currently = {}, reminder currently = {}\n", .{ num1, num2, reminder });
        num1 = num2;
        num2 = reminder;

        reminder = num1 % num2;
        if (reminder == 0) {
            std.debug.print("[INFO] Biggest common divisor get \n", .{});
            break;
        }
    }

    try stdout.print("Biggest common divisor between two positive integer {} and {} is {}\n", .{ initNum1, initNum2, num2 });
}
