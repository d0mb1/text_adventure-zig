const std = @import("std");

const base_bag_size: i8 = 10;

const empty_bag_slot: Item = .{
    .ID = 0,
    .description = "empty bag slot",
    .gold_value = 0,
    .name = "empty slot",
};

const Player = struct {
    map_mark: u8 = 'P',
    max_health: i8 = 10,
    curr_health: i8,
    attack_strenght: i8,
    inventory: [base_bag_size]Item,

    fn printBag(self: Player) void {
        for (self.inventory) |item| {
            if (item.ID == empty_bag_slot.ID) continue;
            std.debug.print("{s}, ", .{item.name});
        }
        std.debug.print("\n", .{});
    }

    fn add_to_bag(self: *Player, new_item: Item) void {
        for (&self.inventory) |*item| {
            if (item.ID == empty_bag_slot.ID) {
                item.* = new_item;
                return;
            }
        }
        std.debug.print("Your bag is full!\n", .{});
    }

    fn remove_from_bag(self: *Player, rem_item: Item) void {
        for (&self.inventory) |*item| {
            if (item.ID == rem_item.ID) {
                item.* = empty_bag_slot;
                return;
            }
        }
        std.debug.print("Item not found\n", .{});
    }
};

const Monster = struct {
    name: []const u8,
    map_mark: u8 = 'M',
    max_health: i8,
    curr_health: i8,
    attack_strenght: i8,
    item_drop: Item,
};

const Item = struct {
    ID: i8,
    name: []const u8,
    map_mark: u8 = 'I',
    gold_value: i8,
    description: []const u8,
};

pub fn main() void {
    var player: Player = .{
        .curr_health = 10,
        .attack_strenght = 2,
        .inventory = [_]Item{empty_bag_slot} ** base_bag_size,
    };
    player.printBag();
    const sword: Item = .{ .ID = 1, .description = "You slash things with it", .gold_value = 4, .name = "sword" };
    const potion: Item = .{ .ID = 2, .description = "Heals you up", .gold_value = 2, .name = "potion of health" };
    player.add_to_bag(sword);
    player.printBag();
    player.remove_from_bag(potion);
    player.add_to_bag(potion);
    player.printBag();
    player.remove_from_bag(sword);
    player.printBag();
    player.remove_from_bag(sword);
    player.printBag();
    player.remove_from_bag(potion);
    player.printBag();
    std.debug.print("Player has: {} max health\n", .{player.max_health});
    std.debug.print("compiled!\n", .{});
}
