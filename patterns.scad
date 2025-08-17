use <config.scad>
module make_d6_pattern_sketch(radius) {
    difference() {
        make_side_sketch(radius - sides_interval * 0.9, 4);
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

module make_d8_pattern_sketch(radius) {
    difference() {
        make_side_sketch(radius + sides_interval * 1.5, 3);
        fine_circle(r = radius * 0.6, $fn = fn);
        for (i = [0 : 2]) rotate(30 + 120 * i) translate([radius, 0]) rotate(45) text(size = radius * 0.5, "ಔ", halign = "center", valign = "center", font = "FreeSerif:style=Обычный");
    }
}

module make_d12_pattern_sketch(radius) {
    difference() {
        make_side_sketch(radius - sides_interval * 0.8, 5);
        fine_circle(r = radius * 0.5, $fn = fn);      
        for (i = [0 : 4]) rotate(55 + 72 * i) translate([radius * 0.7, 0]) rotate(-90) text(size = radius * 0.25, "♕❆۩❀ʢ"[i], halign = "center", valign = "center", font = "FreeSerif:style=Обычный");
    }
}

module make_d20_pattern_sketch(radius) {
    difference() {
        make_side_sketch(radius + sides_interval * 1.5, 3);
        fine_circle(r = radius * 0.6, $fn = fn);
        for (i = [0 : 2]) rotate(30 + 120 * i) translate([radius * 0.95, 0]) rotate(-90) text(size = radius * 0.4, "ℜ", halign = "center", valign = "center", font = "FreeSerif:style=Обычный");
    }
}

module make_d4_pattern_sketch(radius) {
    difference() {
        make_side_sketch(radius - sides_interval * 1.0, 3);
        translate([0, -radius * 0.32]) circle(r = radius * 0.23, $fn = fn);
        translate([radius * 0.28, radius * 0.16]) circle(r = radius * 0.23, $fn = fn);
        translate([-radius * 0.28, radius * 0.16]) circle(r = radius * 0.23, $fn = fn);
        for (i = [0 : 2]) rotate(120 * i) {
            rotate(30) translate([radius * 0.68, 0]) rotate(-90) {
                text(size = radius * 0.2, "❦", halign = "center", valign = "center", font = "FreeSerif:style=Обычный");
            }
            rotate(-30) translate([radius * 0.25, 0]) {
                text(size = radius * 0.2, ")>><", halign = "center", valign = "center", font = "FreeSerif:style=Обычный");
            }
        }
    }
}

module make_d10_pattern_sketch(radius) {difference() {
        make_side_sketch(radius + sides_interval * 0.65, "D10");
        fine_circle(r = radius * 0.6, $fn = fn);
        for (i = [0 : 1]) mirror([i, 0, 0]) rotate(-50) {
            translate([0, radius * 0.92]) mirror([1, 0, 0]) rotate(75) text(size = radius * 0.56, "❡", halign = "center", valign = "center", font = "FreeSerif:style=Обычный");
            rotate(-133) translate([0, radius * 1.15]) rotate(-155) scale([1, 3.5]) text(size = radius * 0.8, ",", halign = "center", valign = "center", font = "Free Times:style=Roman", $fn = fn);
        }
        translate([0, radius * 0.75]) text(size = radius * 0.6, "~", halign = "center", valign = "center", font = "FreeSerif:style=Обычный");
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
                circle(r = r * 0.08, $fn = fn / 3);
            }
            rotate(45 + 90 * i) translate([r * 1.05, 0]) {
                circle(r = r * 0.12, $fn = 3);
            }
        }
        circle(r = r * 0.9, $fn = fn);
    }
}
