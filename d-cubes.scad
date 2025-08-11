TYPE = "D6";

radius = 12;
text_width = 0.8;
with_pattern = true;
fn = 50;

if (TYPE == "D4") make_d4_cube(radius, text_width, with_pattern);
if (TYPE == "D6") make_d6_cube(radius, text_width, with_pattern);
if (TYPE == "D8") make_d8_cube(radius, text_width, with_pattern);
if (TYPE == "D10") make_d10_cube(radius, text_width, with_pattern);
if (TYPE == "D12") make_d12_cube(radius, text_width, with_pattern);
if (TYPE == "D20") make_d20_cube(radius, text_width, with_pattern);

module make_text_side(radius, text_width, number) {
    translate([0, 0, -text_width * 2]) mirror([1, 0, 0]) {
        linear_extrude(text_width * 1.8) {
            text(str(number, number == 6 || number == 9 || number == 66 || number == 99 ? "." : ""),
                size = radius / sqrt(len(str(number))),
                halign = "center", valign = "center",
                font = "DejaVu Serif:style=Bold", $fn = fn);
        }
    }
}

module make_cube_side(radius, text_width, dtype) {
    rotate(90 - 180 / dtype) translate([0, 0, -text_width]) {
        linear_extrude(text_width) {
            offset(r = text_width / 2, $fn = fn / 3) {
                circle(r = radius - text_width, $fn = dtype);
            }
        }
    }
}

module make_ptrn_side(radius, text_width, dtype) {
    translate([0, 0, -text_width * 2]) mirror([1, 0, 0]) {
        linear_extrude(text_width * 1.8) {
            if (dtype == "patternd6") {
                difference() {
                    rotate(90 - 180 / 4) circle(r = radius - text_width * 2, $fn = 4);
                    fine_circle(r = radius * 0.45, $fn = fn);
                    
                    union() {
                        difference() {
                            square([radius * 1.15, radius * 1.15], center = true);
                            square([radius * 1.1, radius * 1.1], center = true);
                            for (i = [0 : 3]) rotate(90 * i) {
                                translate([-radius * 0.5, -radius * 0.5]) square([radius * 0.3, radius * 0.3], center = true);
                            }
                        }
                        for (i = [0 : 3]) rotate(90 * i) {
                            difference() {
                                translate([-radius * 0.48, -radius * 0.48]) square([radius * 0.22, radius * 0.22], center = true);
                                translate([-radius * 0.5, -radius * 0.5]) square([radius * 0.22, radius * 0.22], center = true);
                            }
                            difference() {
                                translate([-radius * 0.5, -radius * 0.5]) rotate(45) square([radius * 0.1, radius * 0.1], center = true);
                                translate([-radius * 0.5, -radius * 0.47]) rotate(45) square([radius * 0.1, radius * 0.1], center = true);
                            }
                        }
                    }
                    
                }
            }
            if (dtype == "patternd8") {
                difference() {
                    rotate(90 - 180 / 3) circle(r = radius + text_width * 4, $fn = 3);
                    fine_circle(r = radius * 0.6, $fn = fn);
                    for (i = [0 : 2]) rotate(30 + 120 * i) translate([radius, 0]) rotate(45) text(size = radius * 0.5, "ಔ", halign = "center", valign = "center", font = "FreeSerif:style=Обычный");
                }
            }
            if (dtype == "patternd12") {
                difference() {
                    rotate(90 - 180 / 5) circle(r = radius - text_width * 2, $fn = 5);
                    fine_circle(r = radius * 0.5, $fn = fn);      
                    for (i = [0 : 4]) rotate(55 + 72 * i) translate([radius * 0.7, 0]) rotate(-90) text(size = radius * 0.25, "♕❆۩❀ʢ"[i], halign = "center", valign = "center", font = "FreeSerif:style=Обычный");
                }
            }
            if (dtype == "patternd20") {
                difference() {
                    rotate(90 - 180 / 3) circle(r = radius + text_width * 4, $fn = 3);
                    fine_circle(r = radius * 0.6, $fn = fn);
                    for (i = [0 : 2]) rotate(30 + 120 * i) translate([radius * 0.95, 0]) rotate(-90) text(size = radius * 0.4, "ℜ", halign = "center", valign = "center", font = "FreeSerif:style=Обычный");
                }
            }
            if (dtype == "patternd4") {
                difference() {
                    rotate(90 - 180 / 3) circle(r = radius - text_width * 2, $fn = 3);
                    translate([0, -radius * 0.32]) fine_circle(r = radius * 0.23, $fn = fn);
                    translate([radius * 0.28, radius * 0.16]) fine_circle(r = radius * 0.23, $fn = fn);
                    translate([-radius * 0.28, radius * 0.16]) fine_circle(r = radius * 0.23, $fn = fn);
                    for (i = [0 : 2]) rotate(28.5 + 120 * i) {
                        translate([radius * 0.7, 0]) text(size = radius * 0.18, "➸", halign = "center", valign = "center", font = "FreeSerif:style=Обычный");
                    }
                       for (i = [0 : 2]) rotate(-32 + 120 * i) {
                           translate([radius * 0.35, 0]) rotate(30) text(size = radius * 0.15, "❦", halign = "center", valign = "center", font = "FreeSerif:style=Обычный");
                       }
                }
            }
            if (dtype == "patternd10") {
                difference() {
                    rotate(-90) {
                        rd = radius + text_width * 3;
                        polygon([[rd, 0], [-rd / 2, rd * sqrt(3) / 2], [-rd * 0.85, 0], [-rd / 2, -rd * sqrt(3) / 2]]);
                    }
                    fine_circle(r = radius * 0.6, $fn = fn);
                    for (i = [0 : 1]) mirror([i, 0, 0]) rotate(-45) {
                        translate([0, radius * 0.95]) mirror([1, 0, 0]) rotate(70) text(size = radius * 0.5, "❡", halign = "center", valign = "center", font = "FreeSerif:style=Обычный");
                    }
                    translate([0, radius * 0.75]) mirror([1, 0, 0])text(size = radius * 0.6, "~", halign = "center", valign = "center", font = "FreeSerif:style=Обычный");
                }
            }
        }
    }
}


module make_dtype_cube(radius, offset_delta, text_width, dtype, xdelta, ydelta, xangle = 0, yangle = 0, i = 1) {
    union() {
        rotate([xdelta[xangle], 0, yangle + (xangle * 2 >= len(ydelta) ? 180 : 0)]) {
            rotate(xangle * 180)
            translate([0, 0, -offset_delta / 2]) {
                if (dtype == "text") {
                    make_text_side(radius, text_width, i);
                } else if (dtype == "d10") {
                    make_d10_side(radius, text_width);
                } else if (dtype == "patternd4" || dtype == "patternd6" || dtype == "patternd8" || dtype == "patternd10" || dtype == "patternd12" || dtype == "patternd20") {
                    make_ptrn_side(radius, text_width, dtype);
                } else {
                    make_cube_side(radius, text_width, dtype);
                }
            }
        }
        if (yangle + ydelta[xangle] < 360) {
            make_dtype_cube(radius, offset_delta, text_width, dtype, xdelta, ydelta, xangle, yangle + ydelta[xangle], i + 1);
        } else if (xangle + 1 < len(ydelta)) {
            make_dtype_cube(radius, offset_delta, text_width, dtype, xdelta, ydelta, xangle + 1, ydelta[xangle + 1] > 0 ? 0 : ydelta[xangle + 1] / 2, i + 1);
        }
    }
}


module make_d6_cube(radius, text_width, with_pattern = false) {
    offset_delta = (radius + text_width * 5);
    difference() {
        hull() make_dtype_cube(radius, offset_delta, text_width, 4, [0, 90, 180], [360, 90, 360]);
        make_dtype_cube(radius * (!with_pattern ? 1 : 0.5), offset_delta, text_width, "text", [0, 90, 180], [360, 90, 360]);
        if (with_pattern) make_dtype_cube(radius, offset_delta, text_width, "patternd6", [0, 90, 180], [360, 90, 360]);
    }
}

module make_d8_cube(radius, text_width, with_pattern = false) {
    offset_delta = (radius + text_width * 5);
    difference() {
        hull() make_dtype_cube(radius, offset_delta, text_width, 3, [0, 70, 110, 180], [360, 120, 120, 360]);
        make_dtype_cube(radius * (!with_pattern ? 0.6 : 0.45), offset_delta, text_width, "text", [0, 70, 110, 180], [360, 120, 120, 360]);
        if (with_pattern) make_dtype_cube(radius * 0.6, offset_delta, text_width, "patternd8", [0, 70, 110, 180], [360, 120, 120, 360]);
    }
}

module make_d12_cube(radius, text_width, with_pattern = false) {
    offset_delta = (radius * 2.15 + text_width * 5);
    scale(1.5 / 2.15) difference() {
        hull() make_dtype_cube(radius, offset_delta, text_width, 5, [0, 63.5, 116.5, 180], [360, 72, 72, 360]);
        make_dtype_cube(radius * (!with_pattern ? 1 : 0.6), offset_delta, text_width, "text", [0, 63.5, 116.5, 180], [360, 72, 72, 360]);
        if (with_pattern) make_dtype_cube(radius, offset_delta, text_width, "patternd12", [0, 63.5, 116.5, 180], [360, 72, 72, 360]);
    }
}

module make_d20_cube(radius, text_width, with_pattern = false) {
    offset_delta = (radius * 2.23 + text_width * 5);
    rotate([-37.5]) difference() {
        hull() make_dtype_cube(radius, offset_delta, text_width, 3, [37.5, 79.5, 100.5, 142.5], [72, 72, 72, 72]);
        make_dtype_cube(radius * (!with_pattern ? 0.6 : 0.45), offset_delta, text_width, "text", [37.5, 79.5, 100.5, 142.5], [72, 72, 72, 72]);
        if (with_pattern) make_dtype_cube(radius * 0.6, offset_delta, text_width, "patternd20", [37.5, 79.5, 100.5, 142.5], [72, 72, 72, 72]);
    }
}


module make_d4_cube(radius, text_width, with_pattern = false) {
    offset_delta = (radius * 0.3 + text_width * 5);
    difference() {
        hull() {
            translate([0, 0, -offset_delta / 2]) {
                make_cube_side(radius, text_width, 3);
            }
            for (i = [0 : 2]) {
                rotate([70, 180, 120 * i]) {
                    translate([0, 0, -offset_delta / 2]) {
                        make_cube_side(radius, text_width, 3);
                    }
                }
            }
        }
        union() {
            text_size = !with_pattern ? 0.4 : 0.3;
            text_place = !with_pattern ? 2 : 3;
            for (i = [0 : 2]) {
                rotate([70, 180, 120 * i]) {
                    translate([0, -radius / text_place, -offset_delta / 2]) {
                        rotate(180) make_text_side(radius * text_size, text_width, 1);
                    }
                }
            }
            for (number = [2 : 4]) {
                translate([0, 0, 0]) {
                    rotate([130, 60, number * 120 + 35]) for (i = [0 : 2]) {
                        rotate([70, 180, 120 * i]) {
                            translate([0, -radius / text_place, -offset_delta / 2]) {
                                rotate(180) make_text_side(radius * text_size, text_width, number);
                            }
                        }
                    }
                }
            }
        }
        if (with_pattern) union() {
            translate([0, 0, -offset_delta / 2]) {
                make_ptrn_side(radius, text_width, "patternd4");
            }
            for (i = [0 : 2]) {
                rotate([70, 180, 120 * i]) {
                    translate([0, 0, -offset_delta / 2]) {
                        make_ptrn_side(radius, text_width, "patternd4");
                    }
                }
            }
        }
    }
}

module make_d10_side(radius, text_width) {
    rotate(-90) translate([0, 0, -text_width]) {
        linear_extrude(text_width) {
            offset(r = text_width / 2, $fn = fn / 3) {
                rd = radius - text_width;
                polygon([[rd, 0], [-rd / 2, rd * sqrt(3) / 2], [-rd * 0.85, 0], [-rd / 2, -rd * sqrt(3) / 2]]);
            }
        }
    }
}

module make_d10_cube(radius, text_width, with_pattern = false) {
    offset_delta = (radius * 2.1 + text_width * 5);
    rotate([-39]) scale(1.8 / 2.1) difference() {
        hull() {
            translate([0, 0, offset_delta * 0.23]) make_dtype_cube(radius, offset_delta, text_width, "d10", [39], [72]);
            rotate([0, 180, 180]) translate([0, 0, offset_delta * 0.23]) make_dtype_cube(radius, offset_delta, text_width, "d10", [39], [72]);
        }
        union() {
            translate([0, 0, offset_delta * 0.23]) make_dtype_cube(radius * (!with_pattern ? 0.65 : 0.45), offset_delta, text_width, "text", [39], [72]);
            rotate([0, 180, 180]) translate([0, 0, offset_delta * 0.23]) make_dtype_cube(radius * (!with_pattern ? 0.65 : 0.45), offset_delta, text_width, "text", [39], [72], i = 6);
        }
        if (with_pattern) union() {
            translate([0, 0, offset_delta * 0.23]) make_dtype_cube(radius * 0.65, offset_delta, text_width, "patternd10", [39], [72]);
            rotate([0, 180, 180]) translate([0, 0, offset_delta * 0.23]) make_dtype_cube(radius * 0.65, offset_delta, text_width, "patternd10", [39], [72], i = 6);
        }
    }
}


module fine_circle(r = 1, $fn = fn) {
    union() {
        difference() {
            circle(r = r * 1.1, $fn = fn);
            circle(r = r * 1.0, $fn = fn);
            for (i = [0 : 3]) {
                rotate(45 * i) square([r * 3, r * 0.3], center = true);
            }
        }
        
        for (i = [0 : 3]) {
            rotate(90 * i) translate([r * 1.05, 0]) {
                circle(r = r * 0.08, $fn = fn);
            }
            rotate(45 + 90 * i) translate([r * 1.05, 0]) {
                circle(r = r * 0.12, $fn = 3);
            }
        }
        circle(r = r * 0.9, $fn = fn);
    }
}