const std = @import("std");
const main = @import("main.zig");

pub const Item = struct {
    ID: i8,
    name: []const u8,
    description: []const u8,
    gold_value: i8,
    map_mark: u8 = 'I',

    pub fn addToBag(self: Item) !void {
        const stdout = std.io.getStdOut().writer();
        for (&main.player.inventory) |*item| {
            if (item.ID == empty_bag_slot.ID) {
                item.* = self;
                return;
            }
        }
        try stdout.print("Your bag is full!\n", .{});
    }

    pub fn removeFromBag(self: Item) !void {
        const stdout = std.io.getStdOut().writer();
        for (&main.player.inventory) |*item| {
            if (item.ID == self.ID) {
                item.* = empty_bag_slot;
                return;
            }
        }
        try stdout.print("Item not found!\n", .{});
    }
};

pub const empty_bag_slot: Item = .{
    .ID = 0,
    .name = "[ Empty slot ]",
    .description = "Empty bag slot.",
    .gold_value = 0,
};

pub const sword: Item = .{
    .ID = 1,
    .name = "[ Sword ]",
    .description = "You slash things with it.",
    .gold_value = 4,
};

pub const potion: Item = .{
    .ID = 2,
    .name = "[ Potion of healing ]",
    .description = "Heals you up.",
    .gold_value = 2,
};

pub const shovel: Item = .{
    .ID = 3,
    .name = "[ Shovel ]",
    .description = "Digs holes and stuff.",
    .gold_value = 1,
};

pub const rope: Item = .{
    .ID = 4,
    .name = "[ Rope ]",
    .description = "Use it for climbing or tying stuff up.",
    .gold_value = 1,
};

pub const torch: Item = .{
    .ID = 5,
    .name = "[ Torch ]",
    .description = "If you have something to light it with it could be useful.",
    .gold_value = 1,
};

pub const ornate_key: Item = .{
    .ID = 6,
    .name = "[ Ornate key ]",
    .description = "Maybe it opens something. Who knows?",
    .gold_value = 10,
};

pub const rock: Item = .{
    .ID = 7,
    .name = "[ Rock ]",
    .description = "Rock. It's just a small rock.",
    .gold_value = 0,
};
