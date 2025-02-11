const std = @import("std");
const main = @import("main.zig");

pub const Room = struct {
    ID: i8,
    name: []const u8,
    description: []const u8,
    enemies: ?[]main.Monster,

    pub fn print_room(self: Room) void {
        const stdout = std.io.getStdOut().writer();
        stdout.print("{s}\n", .{self.name});
        stdout.print("{s}\n", .{self.description});
        stdout.print("There are {} enemies\n", .{self.enemies.len});
    }
};
