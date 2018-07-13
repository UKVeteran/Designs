module elongate() {
  for (i = [0 : $children-1])
    scale([10 , 1, 1 ]) child(i);
}
elongate() {sphere(30); cube(45,center=true); cylinder(r=10,h=50);}