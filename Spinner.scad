$fn = 90;
zero=  0.001;

o   =  0.4;         // 
dB  = 22.0+o;       // 
hB  =  7.0;         // 
                    
n   =  4;           // 
angle = 360/(n-1);  // 

dBt = dB+hB/2;      // 
dBo = dB+hB;        // 
module bearing(d)
{  
   translate([0,0,-zero]) cylinder(d=d, h=hB+2*zero); 
}

// 
module toroid(d) 
{ 
  translate([0,0,hB/2]) rotate_extrude(convexity = 10) translate([(d-hB)/2, 0, 0]) circle(d=hB); 
}

// 
module antitoroid(d) 
{ 
   difference() { cylinder(d=d, h=hB);  toroid(d+hB);} 
}

// 
module double() 
{
   children();   
   mirror() children(); 
}


// 
module part()
{ 
  toroid(dBo);
  translate([0,dBt,  0]) toroid(dBo); 
  
  translate([0,dBt/2,0]) double() 
  difference()
  {  x =tan(60)*dBt/2;
     linear_extrude(height=hB) polygon([[0,-dBt/2],[x,0],[0,dBt/2]]);
     translate([x,0,-zero]) scale([1,1,1.001]) antitoroid(dBo);
  }  
}

module spinner()
{  
   difference()
   {  for(a=[0:angle:360-angle])  rotate([0,0,a-90]) part();
      
      bearing(dB);
      for(a=[90-angle:angle:450-angle])  translate([sin(a)*dBt,cos(a)*dBt,0]) bearing(dB);
   }
}   

 
spinner();

