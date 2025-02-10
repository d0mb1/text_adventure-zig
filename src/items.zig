const main = @import("main.zig");

pub const empty_bag_slot: main.Item = .{
    .ID = 0,
    .description = "empty bag slot",
    .gold_value = 0,
    .name = "empty slot",
};

pub const sword: main.Item = .{
    .ID = 1,
    .name = "sword",
    .description = "You slash things with it",
    .gold_value = 4,
};

pub const potion: main.Item = .{
    .ID = 2,
    .name = "potion of health",
    .description = "Heals you up",
    .gold_value = 2,
};
