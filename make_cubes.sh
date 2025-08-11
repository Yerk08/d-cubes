#!/usr/bin/bash
for i in {4,6,8,10,12,20}; do openscad -DTYPE=\"D$i\" d-cubes.scad -o D$i.3mf & echo D$i; done; wait
