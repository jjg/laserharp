VERSION = "MARK 3";
LASER_DIAMETER = 8; // actual: 6
LASER_LENGTH = 15; // actual: 14
BEAM_SPACING = 90;
SCREW_DIAMETER = 3;
WALL = 2;

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
    
    // spacing cut-outs
    translate([-1,LASER_DIAMETER/2,-1]){
        cube([BEAM_SPACING / 12, LASER_DIAMETER, WALL + 2]);
    }
    translate([(BEAM_SPACING / 2 ) - (BEAM_SPACING / 12) + 1,LASER_DIAMETER+ (LASER_DIAMETER/2),-1]){
        cube([BEAM_SPACING / 12, LASER_DIAMETER, WALL + 2]);
    }
    translate([(BEAM_SPACING / 2 ) - (BEAM_SPACING / 12) + 1,- (LASER_DIAMETER / 2),-1]){
        cube([BEAM_SPACING / 12, LASER_DIAMETER, WALL + 2]);
    }
    
    // laser insert hole
    translate([BEAM_SPACING / 4, LASER_DIAMETER, -1]){
        cylinder(r=LASER_DIAMETER / 2, h=6);
    }
    
    // version emblem
    translate([8,1,WALL-1]){
        rotate([0,0,0]){
            linear_extrude(1){
                text(VERSION, size=2);
            }
        }
    }
}

// laser holder
translate([BEAM_SPACING / 4, LASER_DIAMETER, WALL]){
    difference(){
        
        union(){
            // post
            cylinder(r = (LASER_DIAMETER + WALL) / 2, h=LASER_LENGTH);
/*            
            // top
            translate([0,0,LASER_LENGTH]){
                rotate_extrude(convexity = 10){
                    translate([LASER_DIAMETER / 2, 0, 0]){
                        #circle(r = 1);
                    }
                }
            }
*/            
        }
        
        // hole
        translate([0,0,-1]){
            cylinder(r = (LASER_DIAMETER / 2), h=LASER_LENGTH + 2);
        }
        
        // wiring hole
        translate([0,-WALL,(LASER_LENGTH / 4)]){
            rotate([90, 0, 0]){
                cylinder(r=SCREW_DIAMETER / 2, h=WALL * 2);
            }
        }
        
        // wiring hole
        rotate([0,0,180]){
            translate([0,-WALL,(LASER_LENGTH / 4)]){
                rotate([90, 0, 0]){
                    cylinder(r=SCREW_DIAMETER / 2, h=WALL * 2);
                }
            }
        } 
    }
    
    difference(){
        // top
        translate([0,0,LASER_LENGTH]){
            rotate_extrude(convexity = 10){
                translate([LASER_DIAMETER / 2, 0, 0]){
                    #circle(r = 1);
                }
            }
        }
        
        // expansion cuts
        translate([0,LASER_DIAMETER,LASER_LENGTH]){
            rotate([90, 0, 0]){
                cylinder(r=SCREW_DIAMETER / 2, h=LASER_DIAMETER * 2);
            }
        }
        
        rotate([0,0,90]){
            translate([0,LASER_DIAMETER,LASER_LENGTH]){
                rotate([90, 0, 0]){
                    cylinder(r=SCREW_DIAMETER / 2, h=LASER_DIAMETER * 2);
                }
            }
        }
    }
/*    
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
*/
}