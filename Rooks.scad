module rookBody(){
	union(){
		cylinder(h = 9, r1 = 2.5, r2 = 1.8, $fn = 30);
		difference(){
			translate([0, 0, 9])
				cylinder(h = 3, r1 = 2.5, r2 = 2.9, $fn = 30);
			translate([0, 0, 9.1])
				cylinder(h = 3, r1 = 2.4, r2 = 2.8, $fn = 100);
			translate([0, 0, 12])
				cube(size = [1, 10, 2.1], center = true);
			translate([0, 0, 12])
				rotate([0, 0, 120])
					cube(size = [1, 10, 2.1], center = true);
			translate([0, 0, 12])
				rotate([0, 0, 60])
					cube(size = [1, 10, 2.1], center = true);
		
}
}
}
translate([24.5, 24.5, 0]){
	union(){
		rookBody();
		base(2.4, 3.3, 3);
}
}

translate([-24.5, 24.5, 0]){
	union(){
		rookBody();
		base(2.4, 3.3, 3);
}
}

