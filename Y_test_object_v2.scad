// 1 unit = 10µm
scale_factor = 0.01;
bulk_height = 2000;
bulk_diameter = 1500;
tube_diameter = 400;
bottom_padding = 200;
side_padding = 400;
funnel_height = 500;
y_trunk_height = 700;
y_branch_height = 1200;
y_branch_angle = 15;
holder_height = 700;
holder_diameter = 900;
holder_pin = 10;


module InnerChannels() {
    
    difference() {
    
        translate([0, -bulk_diameter/5, bottom_padding]) {

            cylinder(bulk_height-bottom_padding, d=tube_diameter);
            sphere(d=tube_diameter);

            translate([0, 0, bulk_height-bottom_padding-funnel_height])
                cylinder(funnel_height+1, d1=tube_diameter, d2=tube_diameter*2);

            rotate([-90, 0, 0])
                cylinder(bulk_diameter-side_padding*2, d=tube_diameter);

            translate([0, bulk_diameter-side_padding*2, 0]) {
                
                sphere(d=tube_diameter);
                cylinder(y_trunk_height, d=tube_diameter);
                
                translate([0, 0, y_trunk_height]) {
                    
                    rotate([0, y_branch_angle, 0])
                        cylinder(y_branch_height, d=tube_diameter);
                    rotate([0, -y_branch_angle, 0])
                        cylinder(y_branch_height, d=tube_diameter);
                    
                    
                }
                
            }
            
            translate([-tube_diameter/2, 0, 0])
                cube([tube_diameter, bulk_diameter-side_padding*2, tube_diameter]);

        }

        translate([-(tube_diameter+2)/2, -bulk_diameter/5-tube_diameter/2, -1])
            cube([tube_diameter+2, bulk_diameter-side_padding, (tube_diameter+2)/2]);
                
    }

}

module FullObject() {
    
    difference() {
    
        cylinder(bulk_height, d=bulk_diameter);
        InnerChannels();
        
    }

    translate([0, 0, -holder_height])
        cylinder(holder_height+holder_pin, d=holder_diameter);

    
}

FullObject();
