const std = @import("std");

pub fn build(b: *std.Build) void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    const allocator = gpa.allocator();

    var listSrc = std.ArrayList([]const u8).init(allocator);
    defer listSrc.deinit();
    var listNames = std.ArrayList([]const u8).init(allocator);
    defer listNames.deinit();

    listSrc.append("src/helloWorld.zig") catch unreachable;
    listSrc.append("src/euclidAlgorithm.zig") catch unreachable;

    listNames.append("helloWorld") catch unreachable;
    listNames.append("euclidAlgorithm") catch unreachable;

    const target = b.standardTargetOptions(.{});

    const optimize = b.standardOptimizeOption(.{});

    for (listSrc.items, 0..) |file, index| {
        const exe = b.addExecutable(.{
            .name = listNames.items[index],
            .root_source_file = b.path(file),
            .target = target,
            .optimize = optimize,
        });
        b.installArtifact(exe);
    }
}
