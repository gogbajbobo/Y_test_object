cylinder_radius = 500;
cylinder_heigth = 1000;
trunk_radius = 200;
trunk_heigth = 500;
branch1_radius = 120;
branch2_radius = 80;
branch1_angle = 30;
branch2_angle = -30;
branch1_length = (cylinder_heigth - trunk_heigth) / cos(branch1_angle);
branch2_length = (cylinder_heigth - trunk_heigth) / cos(branch2_angle);

difference() {
    
    cylinder(h = cylinder_heigth, r = cylinder_radius);
    
    union() {

        translate([0, 0, -1])
            cylinder(
                h=trunk_heigth + 1, 
                r=trunk_radius
            );
        
        translate([0, 0, trunk_heigth])
            sphere(r = trunk_radius);
        
        translate([0, 0, trunk_heigth])
        rotate([0, branch1_angle, 0])
            cylinder(
                h=branch1_length + 100, 
                r=branch1_radius
            );
            
        translate([0, 0, trunk_heigth])
        rotate([0, branch2_angle, 0])
            cylinder(
                h=branch2_length + 50, 
                r=branch2_radius
            );
        
    }
    
}
