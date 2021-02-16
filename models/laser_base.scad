VERSION = "MARK 1";
LASER_DIAMETER = 12; // actual: 6
LASER_LENGTH = 15; // actual: 14
BEAM_SPACING = 90;
SCREW_DIAMETER = 3;
WALL = 3;

$fn = 50;

difference(){
    
    // base
    cube([BEAM_SPACING / 2, LASER_DIAMETER * 2, WALL]);
    
    // mounting holes
    translate([BEAM_SPACING / 8, LASER_DIAMETER, -1]){
        cylinder(r=SCREW_DIAMETER / 2, h=6);
    }
    translate([(BEAM_SPACING / 2) - (BEAM_SPACING / 8), LASER_DIAMETER, -1]){
        cylinder(r=SCREW_DIAMETER / 2, h=6);
    }
    
    // laser insert hole
    translate([BEAM_SPACING / 4, LASER_DIAMETER, -1]){
        cylinder(r=LASER_DIAMETER / 2, h=6);
    }
    
    // version emblem
    translate([4,0,WALL-1]){
        rotate([0,0,90]){
            linear_extrude(1){
                text(VERSION, size=3);
            }
        }
    }
}

// laser holder
translate([BEAM_SPACING / 4, LASER_DIAMETER, WALL]){
    difference(){
        
        // post
        cylinder(r = (LASER_DIAMETER + WALL) / 2, h=LASER_LENGTH);
        
        // hole
        translate([0,0,-1]){
            cylinder(r = (LASER_DIAMETER / 2), h=LASER_LENGTH + 1);
        }
        
        // x adjustment screw hole
        translate([0,-WALL,LASER_LENGTH - WALL]){
            rotate([90, 0, 0]){
                cylinder(r=SCREW_DIAMETER / 2, h=WALL * 2);
            }
        }
        
        // y adjustment screw hole
        rotate([0,0,90]){
            translate([0,-WALL,LASER_LENGTH - WALL]){
                rotate([90, 0, 0]){
                    cylinder(r=SCREW_DIAMETER / 2, h=WALL * 2);
                }
            }
        }
    }
    
    // x spring
    translate([-WALL / 2 - 1,WALL * 2,LASER_LENGTH - (WALL * 2)]){
        rotate([30,0,0]){
            cube([WALL + 2, WALL / 4, WALL * 2]);
        }
    }
    
    // y spring
    rotate([0,0,90]){
        translate([-WALL / 2 - 1,WALL * 2,LASER_LENGTH - (WALL * 2)]){
            rotate([30,0,0]){
                cube([WALL + 2, WALL / 4, WALL * 2]);
            }
        }
    }
}