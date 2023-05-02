const print = @import("std").debug.print;

fn print_slice(slice: []usize) void {
    for (slice) |n| {
        print("{}", .{n});
    }
    print("\n", .{});
}

fn partition(slice: []usize, low: usize, high: usize) usize {
    var pivot = slice[high];
    var i = low;
    var j = low;
    while (j <= high) : (j += 1) {
        if (slice[j] < pivot) {
            var tmp = slice[i];
            slice[i] = slice[j];
            slice[j] = tmp;
            i += 1;
        }
    }

    var tmp = slice[i];
    slice[i] = slice[high];
    slice[high] = tmp;

    return i;
}

fn qs(slice: []usize, low: usize, high: usize) void {
    if (low < high) {
        const pivot_idx = partition(slice, low, high);
        qs(slice, low, pivot_idx - 1);
        qs(slice, pivot_idx + 1, high);
    }
}

fn quicksort(slice: []usize) void {
    qs(slice, 0, slice.len - 1);
}

pub fn main() !void {
    var arr = [_]usize{ 1, 3, 2, 4, 5, 6 };
    var slice: []usize = arr[0..6];

    quicksort(slice);

    print_slice(slice);
}
