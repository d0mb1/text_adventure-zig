const main = @import("main.zig");

pub const Item = struct {
    ID: i8,
    name: []const u8,
    map_mark: u8 = 'I',
    gold_value: i8,
    description: []const u8,
};

pub const empty_bag_slot: Item = .{
    .ID = 0,
    .name = "[empty slot]",
    .description = "Empty bag slot",
    .gold_value = 0,
};

pub const sword: Item = .{
    .ID = 1,
    .name = "[sword]",
    .description = "You slash things with it",
    .gold_value = 4,
};

pub const potion: Item = .{
    .ID = 2,
    .name = "[potion of healing]",
    .description = "Heals you up",
    .gold_value = 2,
};
