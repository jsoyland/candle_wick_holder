$fn=32;
diameter=105;         //diameter of object
outer_rim=10;         //width of the outer circle 
thickness=1;          //thickness
support_width=10;     //width of supports
wick_hole_postion=20; //distance from center for each wick
wick_hole_diameter=3; //diameter of hole for wick


module arm() {
     difference(){
        cube([diameter/2*.95,support_width,thickness],center=false);
        translate([wick_hole_postion, support_width/2, -0.1*thickness]) cylinder(r=wick_hole_diameter/2, h=1.2*thickness, center=false);
    }
}

union() {
    difference() {
        cylinder(r=diameter/2,h=thickness,center=true);
        cylinder(r=(diameter/2-(outer_rim)),h=thickness+1,center=true);
    }
    rotate([0,0,0]) 
        translate([0,-support_width/2,-thickness/2]) 
            arm();

    rotate([0,0,120]) 
        translate([0,-support_width/2,-thickness/2]) 
            arm();

    rotate([0,0,240]) 
        translate([0,-support_width/2,-thickness/2]) 
            arm();
}

