cube(size =[10,21,1],center=true);

translate([4.5,0,1])

cube(size =[1,21,1],center=true);

translate([-4.5,0,1])

cube(size =[1,21,1],center=true);

union(){ translate ([4.5,9,-3])

cylinder(h=5, r=1, center=true, $fn=100);

translate ([-4.5,9,-3])

cylinder(h=5, r=1, center=true, $fn=100);

translate ([-5.5,9,-1.5])

rotate ([90,0,90]) cylinder (r=1, h=11,$fn=100);

}

union(){

translate ([4.5,-9,-3])

cylinder(h=5, r=1, center=true, $fn=100);

translate ([-4.5,-9,-3])

cylinder(h=5, r=1, center=true, $fn=100);

translate ([-5.5,-9,-1.5])

rotate ([90,0,90]) cylinder (r=1, h=11,$fn=100);

} 