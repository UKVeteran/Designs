///Main Part///
 ///top///
 difference() {
 difference() {
 translate([0,0,8])
 cylinder(h=12, r1=5, r2=3, center=true, $fn=200);
 translate([0,5,8])
 cube( size= [12,6,17], center=true);
 }
}
;
 difference() {
 translate([0,0,13.21])
 sphere( r=3.1, center=true, $fn=200);
 translate([0,5,])
 cube( size= [12,6,12], center=true);
 }
 ///base///
 difference() { 
 translate([0,0,-17])
 cylinder(h=38, r=5, center=true, $fn=200);
 translate([0,5,-15])
 cube( size= [12,6,50], center=true);
 }
 
///Wing One///
 polyhedron( 
 points=[ [4.6,-.5,-45], [4.6,2.005,-45], [4.4,2.005,-5], [11.8,2.005,-20], [24.8,2.005,-35], [24.8,2.005,-40] ],
 faces=[ [0,1,2], [0,2,3,4,5], [1,2,3,4,5], [0,1,5] ]
 );
////Wing Two////
 polyhedron( 
 points=[ [-4.6,-.5,-45], [-4.6,2.005,-45], [-4.4,2.005,-5], [-11.8,2.005,-20], [-24.8,2.005,-35], [-24.8,2.005,-40] ],
 faces=[ [0,1,2], [0,2,3,4,5], [1,2,3,4,5], [0,1,5] ]
 );
 
///Rockets///

/// Rocket One///
 difference() {
 translate([2.5,0.1,-40])
 cylinder(h=10, r=1.7, center=true, $fn=200);
 translate([2.5,0.1,-40])
 cylinder(h=11, r=1.5, center=true, $fn=200);
 }
 /// Rocket Two///
 difference() {
 translate([-2.5,.1,-40])
 cylinder(h=10, r=1.7, center=true, $fn=200);
 translate([-2.5,.1,-40])
 cylinder(h=11, r=1.5, center=true, $fn=200);
 }
 /// Rocket Three///
 difference() {
 translate([0,-2.5,-40])
 cylinder(h=10, r=1.7, center=true, $fn=200);
 translate([0,-2.5,-40])
 cylinder(h=11, r=1.5, center=true, $fn=200);
 }
///Rocket Edits///
/////
///Rockets///
 /// Rocket One///

/// Rocket Two///
 
 /// Rocket Three///

///parameters///
a=-40;
b=.1;
c=2.5;
/////
difference () {
 {

translate([c,b,a])
 cylinder(h=10, r=2, center=true, $fn=200);

}
 ////////// 
/// parameters///
x=-30;
//// cuts///
{

translate([c,b,x-7])
 cube( size=[4,4,.5], center=true);
 translate([c,b,x-8])
 cube( size=[4,4,.5], center=true);
 translate([c,b,x-9])
 cube( size=[4,4,.5], center=true);
 translate([c,b,x-10])
 cube( size=[4,4,.5], center=true);
 translate([c,b,x-11])
 cube( size=[4,4,.5], center=true);
 translate([c,b,x-12])
 cube( size=[4,4,.5], center=true);
 translate([c,b,x-13])
 cube( size=[4,4,.5], center=true);
 translate([c,b,x-14])
 cube( size=[4,4,.5], center=true);
 translate([c,b,x-15])
 cube( size=[4,4,.5], center=true);
 translate([c,b,x-16])
 cube( size=[4,4,.5], center=true);
 translate([c,b,x-17])
 cube( size=[4,4,.5], center=true);

}
 }
 ///parameters///
a=-40;
b=.1;
c=2.5;
/////
difference () {
 {

translate([-c,b,a])
 cylinder(h=10, r=2, center=true, $fn=200);
 
}
 ////////// 
/// parameters///
x=-30;
//// cuts///
{

translate([-c,b,x-7])
 cube( size=[4,4,.5], center=true);
 translate([-c,b,x-8])
 cube( size=[4,4,.5], center=true);
 translate([-c,b,x-9])
 cube( size=[4,4,.5], center=true);
 translate([-c,b,x-10])
 cube( size=[4,4,.5], center=true);
 translate([-c,b,x-11])
 cube( size=[4,4,.5], center=true);
 translate([-c,b,x-12])
 cube( size=[4,4,.5], center=true);
 translate([-c,b,x-13])
 cube( size=[4,4,.5], center=true);
 translate([-c,b,x-14])
 cube( size=[4,4,.5], center=true);
 translate([-c,b,x-15])
 cube( size=[4,4,.5], center=true);
 translate([-c,b,x-16])
 cube( size=[4,4,.5], center=true);
 translate([-c,b,x-17])
 cube( size=[4,4,.5], center=true);

}
 }

///parameters///
a=-40;
d=-2.5;
e=0;
/////
difference () {
 {

translate([e,d,a])
 cylinder(h=10, r=2, center=true, $fn=200);

}
 ////////// 
/// parameters///
x=-30;
//// cuts///
{

translate([e,d,x-7])
 cube( size=[4,4,.5], center=true);
 translate([e,d,x-8])
 cube( size=[4,4,.5], center=true);
 translate([e,d,x-9])
 cube( size=[4,4,.5], center=true);
 translate([e,d,x-10])
 cube( size=[4,4,.5], center=true);
 translate([e,d,x-11])
 cube( size=[4,4,.5], center=true);
 translate([e,d,x-12])
 cube( size=[4,4,.5], center=true);
 translate([e,d,x-13])
 cube( size=[4,4,.5], center=true);
 translate([e,d,x-14])
 cube( size=[4,4,.5], center=true);
 translate([e,d,x-15])
 cube( size=[4,4,.5], center=true);
 translate([e,d,x-16])
 cube( size=[4,4,.5], center=true);
 translate([e,d,x-17])
 cube( size=[4,4,.5], center=true);

}
 }