const std = @import("std");

const INPUT_FILE_NAME = "input.txt";
const NUM_DIAL_VALUES: u32 = 100;

pub fn main() !void {
    const stdout = std.fs.File.stdout();
    var stdoutWriterWrapper = stdout.writer(&.{});
    const stdoutWriter = &stdoutWriterWrapper.interface;

    const file = try std.fs.cwd().openFile(INPUT_FILE_NAME, .{});
    defer file.close();

    var buf: [5]u8 = undefined;

    var fileReader = file.reader(&buf);
    const reader = &fileReader.interface;

    var dial: u32 = 50;
    var zeroInsts: u32 = 0;

    try stdoutWriter.print("Dial starting at: {d}\n", .{dial});

    while (try reader.takeDelimiter('\n')) |line| {
        const dir = line[0];
        const amt = try std.fmt.parseInt(u32, line[1..], 10);

        if (dir == 'R') {
            dial = (dial + amt) % NUM_DIAL_VALUES;
        } else {
            dial = (dial + (NUM_DIAL_VALUES - (amt % NUM_DIAL_VALUES))) % NUM_DIAL_VALUES;
        }

        if (dial == 0) {
            zeroInsts += 1;
        }

        try stdoutWriter.print("Dial after {s} at: {d}\n", .{line, dial});
    }

    try stdoutWriter.print("Number of zero instances: {d}\n", .{zeroInsts});
}
