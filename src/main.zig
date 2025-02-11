const std = @import("std");
const items = @import("items.zig");

const base_bag_size: i8 = 10;

pub const Player = struct {
    map_mark: u8 = 'P',
    max_health: i8 = 10,
    curr_health: i8,
    attack_strenght: i8,
    inventory: [base_bag_size]items.Item,

    fn printBag(self: Player) !void {
        const stdout = std.io.getStdOut().writer();
        const num_of_columns = 5;
        var empty_spaces: usize = 0;
        for (self.inventory, 1..) |item, i| {
            if (item.ID == items.empty_bag_slot.ID) {
                empty_spaces += 1;
                continue;
            }
            try stdout.print("{s} ", .{item.name});
            if (i % num_of_columns == 0) try stdout.print("\n", .{});
        }
        const full_spaces = 10 - empty_spaces;
        for (0..empty_spaces, full_spaces..) |e, i| {
            if (i % num_of_columns == 0 and e != 0) try stdout.print("\n", .{});
            try stdout.print("[ ] ", .{});
        }
        std.debug.print("\n\n", .{});
    }

    fn add_to_bag(self: *Player, new_item: items.Item) !void {
        const stdout = std.io.getStdOut().writer();
        for (&self.inventory) |*item| {
            if (item.ID == items.empty_bag_slot.ID) {
                item.* = new_item;
                return;
            }
        }
        try stdout.print("Your bag is full!\n", .{});
    }

    fn remove_from_bag(self: *Player, rem_item: items.Item) !void {
        const stdout = std.io.getStdOut().writer();
        for (&self.inventory) |*item| {
            if (item.ID == rem_item.ID) {
                item.* = items.empty_bag_slot;
                return;
            }
        }
        try stdout.print("Item not found\n", .{});
    }
};

const Monster = struct {
    name: []const u8,
    map_mark: u8 = 'M',
    max_health: i8,
    curr_health: i8,
    attack_strenght: i8,
    item_drop: items.Item,
};

pub fn main() !void {
    const stdout = std.io.getStdOut().writer();
    var player: Player = .{
        .curr_health = 10,
        .attack_strenght = 2,
        .inventory = [_]items.Item{items.empty_bag_slot} ** base_bag_size,
    };
    try player.printBag();
    try player.add_to_bag(items.sword);
    try player.add_to_bag(items.sword);
    try player.add_to_bag(items.sword);
    try player.add_to_bag(items.sword);
    try player.add_to_bag(items.sword);
    try player.add_to_bag(items.sword);
    try player.add_to_bag(items.sword);
    try player.add_to_bag(items.sword);
    try player.add_to_bag(items.potion);
    try player.printBag();
    try stdout.print("Player has: {} max health\n", .{player.max_health});
    try stdout.print("Compiled!\n", .{});
}
