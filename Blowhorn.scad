function linspace(xmin,xmax,n,i)=xmin+i*(xmax-xmin)/n;

function deg(x)=180*x/3.1415926;

function amplitude(t,radius,lambda,) = radius*exp(-lambda*t);

function samplitude(t,sradius,slambda) = sradius*(1+exp(-slambda*t));

function coordinates(t) = [cos(deg(t)), sin(deg(t)),.2*t];


module snailsphere(tmin,tmax,n,radius,lambda,sradius,slambda){
	for (i=[0:n-1]){
		hull(){
 		    translate(amplitude(linspace(tmin,tmax,n,i),radius,lambda)*coordinates(linspace(tmin,tmax,n,i)),0){
 			sphere(r=samplitude(linspace(tmin,tmax,n,i),sradius,slambda));}
 		    translate(amplitude(linspace(tmin,tmax,n,i+1),radius,lambda)*coordinates(linspace(tmin,tmax,n,i+1)),0){
 			sphere(r=samplitude(linspace(tmin,tmax,n,i+1),sradius,slambda));}}}}


module snail(tmin,tmax,n,radius,lambda,sradius,slambda){
	for (i=[0:n-1]){
		hull(){
		    translate(amplitude(linspace(tmin,tmax,n,i),radius,lambda)*coordinates(linspace(tmin,tmax,n,i)),0){
			rotate([0,90,deg(linspace(tmin,tmax,n,i))+90]){
 			    cylinder(h=2,r=samplitude(linspace(tmin,tmax,n,i),sradius,slambda));}}
 		    translate(amplitude(linspace(tmin,tmax,n,i+1),radius,lambda)*coordinates(linspace(tmin,tmax,n,i+1)),0){
			rotate([0,90,deg(linspace(tmin,tmax,n,i+1))+90]){
 			    cylinder(h=2,r=samplitude(linspace(tmin,tmax,n,i+1),sradius,slambda));}}}}}



reff=32/2;
//$fn = 20;
//$fa=3;
pi=3.1415926;
2pi=2*3.1415926;
sr=5;
sl=.45;

r=25;
l=.00001;

n=50;
lenght=100;
with=100;
height=120;

baser=45;

rotate([90,0,0])
union(){
    difference(){
	snail(-pi,2*pi,n,r,l,sr,sl);
	snail(-pi-.2,2*pi+1,n,r,l,sr-sr/8,sl);}}





