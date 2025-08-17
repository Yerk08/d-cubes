include <config.scad>
include <patterns.scad>
include <utils.scad>

TYPE = "D4";
with_pattern = true;
fn = 50;

if (TYPE == "D4") make_d4_cube(radius, with_pattern);
if (TYPE == "D6") make_d6_cube(radius, with_pattern);
if (TYPE == "D8") make_d8_cube(radius, with_pattern);
if (TYPE == "D10") make_d10_cube(radius, with_pattern);
if (TYPE == "D12") make_d12_cube(radius, with_pattern);
if (TYPE == "D20") make_d20_cube(radius, with_pattern);


module make_d6_cube(radius, with_pattern = false) {
    scalesize = 1.0;
    offset_delta = radius;
    module local_create_cube(radius, type) {
        make_dtype_cube_scaled(radius, offset_delta, scalesize, type, [0, 90, 180], [360, 90, 360]);
    }
    difference() {
        hull() local_create_cube(radius, 4);
        local_create_cube(radius * (!with_pattern ? 1 : 0.5), "Tcommon");
        if (with_pattern) local_create_cube(radius, "T6pattern");
    }
}

module make_d8_cube(radius, with_pattern = false) {
    scalesize = 1.0;
    offset_delta = radius;
    module local_create_cube(radius, type) {
        make_dtype_cube_scaled(radius, offset_delta, scalesize, type, [0, 70, 110, 180], [360, 120, 120, 360]);
    }
    difference() {
        hull() local_create_cube(radius, 3);
        local_create_cube(radius * (!with_pattern ? 0.6 : 0.45), "Tcommon");
        if (with_pattern) local_create_cube(radius * 0.6, "T8pattern");
    }
}

module make_d12_cube(radius, with_pattern = false) {
    scalesize = (1.5 / 2.15);
    offset_delta = radius * 2.15;
    module local_create_cube(radius, type) {
        make_dtype_cube_scaled(radius, offset_delta, scalesize, type, [0, 63.5, 116.5, 180], [360, 72, 72, 360]);
    }
    difference() {
        hull() local_create_cube(radius, 5);
        local_create_cube(radius * (!with_pattern ? 1 : 0.6), "Tcommon");
        if (with_pattern) local_create_cube(radius, "T12pattern");
    }
}

module make_d20_cube(radius, with_pattern = false) {
    scalesize = 1.0;
    offset_delta = radius * 2.23;
    module local_create_cube(radius, type) {
        make_dtype_cube_scaled(radius, offset_delta, scalesize, type, [37.5, 79.5, 100.5, 142.5], [72, 72, 72, 72]);
    }
    rotate([-37.5]) difference() {
        hull() local_create_cube(radius, 3);
        local_create_cube(radius * (!with_pattern ? 0.6 : 0.45), "Tcommon");
        if (with_pattern) local_create_cube(radius * 0.6, "T20pattern");
    }
}

module make_d4_text_sketch(radius, number) {    
    numbers = [[2, 4, 3],
               [4, 2, 1],
               [2, 3, 1],
               [3, 4, 1]];
    for (j = [0 : 2]) {
        rotate(30 + 120 * j) {
            translate([radius * 0.55, 0]) {
                rotate(-90) {
                    make_text_sketch(radius * 0.5,
                    numbers[number - 1][j]);
                }
            }
        }
    }
}

module make_d4_cube(radius, with_pattern = false) {
    scalesize = 1.0;
    offset_delta = radius * 0.33;
    module local_create_cube(radius, type) {
        make_dtype_cube_scaled(radius, offset_delta, scalesize, type, [0, 109.5], [360, 120], swap_points = [0]);
    }
    difference() {
        hull() local_create_cube(radius, 3);
        local_create_cube(radius * (!with_pattern ? 0.9 : 0.6), "T4");
        if (with_pattern) local_create_cube(radius, "T4pattern");
    }
}

module make_d10_cube(radius, with_pattern = false) {
    scalesize = (1.6 / 2.1);
    offset_delta = radius * 1.75;
    offset_union_param = radius * 0.13;
    ang = 53;
    module local_create_cube(radius, type) {
        translate([0, 0, offset_union_param * scalesize]) {
            make_dtype_cube_scaled(radius, offset_delta, scalesize, type, [ang], [72]);
        }
        rotate([0, 180, 180]) translate([0, 0, offset_union_param * scalesize]) {
            make_dtype_cube_scaled(radius, offset_delta, scalesize, type, [ang], [72], i = 6);
        }
    }
    rotate([-ang]) difference() {
        hull() local_create_cube(radius, "D10");
        local_create_cube(radius * (!with_pattern ? 0.65 : 0.45), "Tcommon");
        if (with_pattern) local_create_cube(radius * 0.65, "T10pattern");
    }
}
