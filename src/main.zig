const std = @import("std");
const items = @import("items.zig");
const rooms = @import("rooms.zig");

const bag_size: i8 = 10;

pub const Player = struct {
    map_mark: u8 = 'P',
    max_health: i8 = 10,
    curr_health: i8,
    attack_strenght: i8,
    inventory: [bag_size]items.Item,

    fn printBag(self: Player) !void {
        const stdout = std.io.getStdOut().writer();
        const num_of_columns = 5;
        var empty_spaces: usize = 0;
        for (self.inventory, 1..) |item, i| {
            if (item.ID == items.empty_bag_slot.ID) {
                empty_spaces += 1;
                continue;
            }
            try stdout.print("{s}  ", .{item.name});
            if (i % num_of_columns == 0) try stdout.print("\n", .{});
        }
        const full_spaces = bag_size - empty_spaces;
        for (0..empty_spaces, full_spaces..) |e, i| {
            if (i % num_of_columns == 0 and e != 0) try stdout.print("\n", .{});
            try stdout.print("[ ---- ]  ", .{});
        }
        std.debug.print("\n\n", .{});
    }

    // NOTE: Might not be needed. Alternative fn in Item struct
    fn addToBag(self: *Player, new_item: items.Item) !void {
        const stdout = std.io.getStdOut().writer();
        for (&self.inventory) |*item| {
            if (item.ID == items.empty_bag_slot.ID) {
                item.* = new_item;
                return;
            }
        }
        try stdout.print("Your bag is full!\n", .{});
    }

    // NOTE: Might not be needed. Alternative fn in Item struct
    fn removeFromBag(self: *Player, rem_item: items.Item) !void {
        const stdout = std.io.getStdOut().writer();
        for (&self.inventory) |*item| {
            if (item.ID == rem_item.ID) {
                item.* = items.empty_bag_slot;
                return;
            }
        }
        try stdout.print("Item not found!\n", .{});
    }
};

pub var player: Player = .{
    .curr_health = 10,
    .attack_strenght = 2,
    .inventory = [_]items.Item{items.empty_bag_slot} ** bag_size,
};

pub const Monster = struct {
    name: []const u8,
    map_mark: u8 = 'M',
    max_health: i8,
    curr_health: i8,
    attack_strenght: i8,
    item_drop: items.Item,
};

pub fn main() !void {
    const stdout = std.io.getStdOut().writer();
    try stdout.print("\x1B[2J\x1B[H", .{});
    // var curr_room = rooms.entrance;
    // try items.sword.addToBag();
    // try items.rock.addToBag();
    // try player.printBag();
    // try rooms.entrance.print();
    // try items.potion.removeFromBag();
    // try items.sword.removeFromBag();
    // try player.printBag();
    while (true) {
        // curr_room = try curr_room.walkThrueRooms();
    }
}
