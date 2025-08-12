include <config.scad>

module make_text_sketch(radius, number) {
    text(str(number, number == 6 || number == 9 || number == 66 || number == 99 ? "." : ""),
        size = radius / sqrt(len(str(number))),
        halign = "center", valign = "center",
        font = "DejaVu Serif:style=Bold", $fn = fn);
}

module make_text_side(radius, dtype, number) {
    translate([0, 0, -text_width * 3]) mirror([1, 0, 0]) {
        linear_extrude(text_width * 3) {
            if (dtype == "T4") {
                make_d4_text_sketch(radius, number);
            } else if (dtype == "T6pattern") {
                make_d6_pattern_sketch(radius);
            } else if (dtype == "T8pattern") {
                make_d8_pattern_sketch(radius);
            } else if (dtype == "T12pattern") {
                make_d12_pattern_sketch(radius);
            } else if (dtype == "T20pattern") {
                make_d20_pattern_sketch(radius);
            } else if (dtype == "T4pattern") {
                make_d4_pattern_sketch(radius);
            } else if (dtype == "T10pattern") {
                make_d10_pattern_sketch(radius);
            } else if (dtype == "Tcommon") {
                make_text_sketch(radius, number);
            }
        }
    }
}

module make_side_sketch(r, dtype) {
    if (dtype == "D10") {
        rotate(-90) polygon([[r * 1.5, 0], [-r / 2, r * sqrt(3) / 2], [-r * 0.95, 0], [-r / 2, -r * sqrt(3) / 2]]);
    } else {
        rotate(90 - 180 / dtype) circle(r, $fn = dtype);
    }
}

module make_cube_side(radius, dtype) {
    translate([0, 0, -text_width]) {
        linear_extrude(text_width) {
            offset(r = sides_interval / 2, $fn = fn / 3) {
                make_side_sketch(radius - sides_interval, dtype);
            }
        }
    }
}


module make_dtype_cube(radius, offset_delta, dtype, xdelta, ydelta, xangle = 0, yangle = 0, i = 1, swap_points = []) {
    union() {
        rotate([xdelta[xangle], 0, yangle + ((xangle * 2 >= len(ydelta) && len(swap_points) == 0) || search(xangle, swap_points) ? 180 : 0)]) {
            rotate(xangle * 180)
            translate([0, 0, -offset_delta / 2]) {
                if (is_string(dtype) && dtype[0] == "T") {
                    make_text_side(radius, dtype, i);
                } else if (is_num(dtype) || dtype[0] == "D") {
                    make_cube_side(radius, dtype);
                }
            }
        }
        if (yangle + ydelta[xangle] < 360) {
            make_dtype_cube(radius, offset_delta, dtype, xdelta, ydelta, xangle, yangle + ydelta[xangle], i + 1);
        } else if (xangle + 1 < len(ydelta)) {
            make_dtype_cube(radius, offset_delta, dtype, xdelta, ydelta, xangle + 1, ydelta[xangle + 1] > 0 ? 0 : ydelta[xangle + 1] / 2, i + 1);
        }
    }
}

module make_dtype_cube_scaled(radius, offset_delta, scalesize, dtype, xdelta, ydelta, xangle = 0, yangle = 0, i = 1, swap_points = []) {
    make_dtype_cube(radius * scalesize, (offset_delta + (sides_interval * 2.5 - text_width * 1.5)) * scalesize, dtype, xdelta, ydelta, xangle = xangle, yangle = yangle, i = i, swap_points = swap_points);
}