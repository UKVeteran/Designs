module kingBody(){
	cylinder(h = 12, r1 = 3.2, r2 = 1.6, $fn = 30);
	translate([0, 0, 12])
		cylinder(h = 4, r1 = 1.6, r2 = 2.4, $fn = 30);
}

module kingsCross(dim){  
	difference(){
		translate([0, 0, dim/2])
			cube(size = [dim, .1, dim], center = true);

		translate([-.3501*dim, 0, .1499*dim])
			cube(size = [.3*dim, .11, .3*dim], center = true);
		translate([.3501*dim, 0, .1499*dim])
			cube(size = [.3*dim, .11, .3*dim], center = true);
		translate([.3501*dim, 0, .8501*dim])
			cube(size = [.3*dim, .11, .3*dim], center = true);
		translate([-.3501*dim, 0, .8501*dim])
			cube(size = [.3*dim, .11, .3*dim], center = true);

}
}
translate([3.5, 24.5, 0]){
union(){
	kingBody();
	translate([0, 0, 16])
		kingsCross(2);
	translate([0, 0, 11])
		ring(2, 5, 0);
	base(3, 3.5, 3.6);
}
}
