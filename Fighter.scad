//Constants
pod_radius = 20;
pylon_length = 31;
solar_array_out_radius = 50;
solar_array_in_radius = 10;
//view_port factor. The smaller the bigger the view_port
view_port = 1.5;

//Main
command_pod(pod_radius,view_port);
translate([pod_radius+pylon_length-1,0,0]) rotate([30,0,0]) rotate([0,90,0]) solar_array(solar_array_out_radius,solar_array_in_radius);
translate([-pod_radius-pylon_length+1,0,0]) rotate([30,0,0]) rotate([0,-90,0]) solar_array(solar_array_out_radius,solar_array_in_radius);
translate([pod_radius+pylon_length/2-2,0,0]) rotate([0,-90,0]) rotate([0,0,90]) wing_pylon(pylon_length);
translate([-pod_radius-pylon_length/2+2,0,0]) rotate([0,90,0]) rotate([0,0,90]) wing_pylon(pylon_length);

//Modules
module solar_array (outer_radius, inner_radius) {
    difference() {
        union() {
            cylinder(r=outer_radius,h=2,$fn=6);
            cylinder(r=inner_radius,h=4,$fn=6);
        }
        for (i=[1:6]) {
            rotate([0,0,i*360/6]) translate([0,inner_radius,0]) translate([0,0,1]) solar_panel(outer_radius,inner_radius);
            rotate([0,0,i*360/6]) translate([0,inner_radius,0]) translate([0,0,-0.3]) solar_panel(outer_radius,inner_radius);
        }
    }
}

module solar_panel(outer_radius, inner_radius) {
    //delta determines the size of the edge of the solar array.
    delta = 3;
    //x and y determines outer side of the solar panel trapezoid
    x = inner_radius/2 + sin(30) * (outer_radius-inner_radius-delta);
    y = cos(30) * (outer_radius-inner_radius-delta);
    list = [[-inner_radius/2,0],[inner_radius/2,0],[x,y],[-x,y]];
    linear_extrude(1)
    polygon(list);
}

module wing_pylon(pylon_length) {
     linear_extrude(height = pylon_length+2, center = true, convexity = 10, scale=[1,2], $fn=100) circle(r = 4);
}

module command_pod(pod_radius,view_port) {
    difference() {
        sphere(r=pod_radius);
        translate([0,view_port*pod_radius,0]) sphere(r=pod_radius);
    }
}


