// -- vars --
size = 11.5;
height = 0.5;
quality = 40;

// -- faces --
module face(cnt) {
    cylinder(r = size, h = height * 2, $fn = 5);
}
module face_number(cnt) {
    difference() {
        translate([0, 0, -height * 0.5]) {
            cylinder(r1 = size - height, h = height * 1.5, r2 = size - height * 2, $fn = 5);
        }
        linear_extrude(height = height) {
            rotate([0, 0, -90 / 5]) mirror([1, 0, 0]) {
                text(cnt == 6 || cnt == 9 ? str(cnt, ".") : str(cnt), font = "Noto Sans Sinhala:style=Medium", size = size * 0.9, halign = "center", valign = "center", $fn = quality);
            }
        }
    }
}

// -- figure --
module d12() {
    face(1);
    for (i = [2:6]) {
        rotate([0, 0, 180 / 5 * (i * 2 - 1)]) {
            translate([0, 0, -sin(45 / 5 * 7) * (size * 1.03 - height * 5)]) {
                rotate([0, -45 / 5 * 7, 0]) {
                    translate([(size - height * 2) * 2, 0, -size * cos(360 / 5) - height * 2]) face(i);
                }
            }
        }
    }
    translate([0, 0, 1.5388 * ((size - height) * sin(45 / 5 * 7) + (size - height / 2) * cos(180 / 5)) + height * 2]) rotate([180, 0, 180 / 5]) {
        face(12);
        for (i = [7:11]) {
            rotate([0, 0, 180 / 5 * (i * 2 - 1)]) {
                translate([0, 0, -sin(45 / 5 * 7) * (size * 1.03 - height * 5)]) {
                    rotate([0, -45 / 5 * 7, 0]) {
                        translate([(size - height * 2) * 2, 0, -size * cos(360 / 5) - height * 2]) face(i);
                    }
                }
            }
        }
    }
}


// -- numbers --
module d12_numbers() {
    face_number(1);
    for (i = [2:6]) {
        rotate([0, 0, 180 / 5 * (i * 2 - 1)]) {
            translate([0, 0, -sin(45 / 5 * 7) * (size * 1.03 - height * 5)]) {
                rotate([0, -45 / 5 * 7, 0]) {
                    translate([(size - height * 2) * 2, 0, -size * cos(360 / 5) - height * 2]) face_number(i);
                }
            }
        }
    }
    translate([0, 0, 1.5388 * ((size - height) * sin(45 / 5 * 7) + (size - height / 2) * cos(180 / 5)) + height * 2]) rotate([180, 0, 180 / 5]) {
        face_number(12);
        for (i = [7:11]) {
            rotate([0, 0, 180 / 5 * (i * 2 - 1)]) {
                translate([0, 0, -sin(45 / 5 * 7) * (size * 1.03 - height * 5)]) {
                    rotate([0, -45 / 5 * 7, 0]) {
                        translate([(size - height * 2) * 2, 0, -size * cos(360 / 5) - height * 2]) face_number(i);
                    }
                }
            }
        }
    }
}

// -- result --
difference() {
    hull() d12();
    d12_numbers();
}
