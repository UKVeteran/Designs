$fn = 150;
 
 // 
brick(5,3,3);


// 

FLU = 1.6; //

BRICK_WIDTH = 5*FLU; 
BRICK_HEIGHT = 6*FLU; 
PLATE_HEIGHT = 2*FLU; 
WALL_THICKNESS = FLU; 
STUD_RADIUS = 1.5*FLU; 
STUD_HEIGHT = FLU; 
ANTI_STUD_RADIUS = 0.5*4.07*FLU;  
PIN_RADIUS = FLU; 
SUPPORT_THICKNESS = 0.254; 
EDGE = 0.254; 
CORRECTION = 0.1; 
module brick(length = 4, width = 2, height = 3, smooth = false){

	
	difference(){
		cube(size = [length*BRICK_WIDTH,width*BRICK_WIDTH,height*PLATE_HEIGHT]);
		translate([WALL_THICKNESS,WALL_THICKNESS,-WALL_THICKNESS])
		union(){
			cube(size = [length*BRICK_WIDTH-2*WALL_THICKNESS,width*BRICK_WIDTH-2*WALL_THICKNESS,height*PLATE_HEIGHT]);
			// stud inner holes, radius = pin radius
			if (!smooth) {
				translate([STUD_RADIUS+WALL_THICKNESS,STUD_RADIUS+WALL_THICKNESS,height*PLATE_HEIGHT])
				for (y = [0:width-1]){
					for (x = [0:length-1]){
						translate ([x*BRICK_WIDTH-WALL_THICKNESS,y*BRICK_WIDTH-WALL_THICKNESS,-CORRECTION])
						cylinder(h=WALL_THICKNESS+2*CORRECTION,r=PIN_RADIUS);
					}
				}
			}
			
			else {
				translate([-WALL_THICKNESS-CORRECTION,-WALL_THICKNESS-CORRECTION,FLU-CORRECTION]) 
				difference() {
					cube([length*BRICK_WIDTH+2*CORRECTION,width*BRICK_WIDTH+2*CORRECTION,EDGE+CORRECTION]);
					translate([EDGE+CORRECTION,EDGE+CORRECTION,-CORRECTION])
					cube([length*BRICK_WIDTH-2*EDGE,width*BRICK_WIDTH-2*EDGE,EDGE+3*CORRECTION]); 
				}
			}
		}
	}
	// Studs
	if(!smooth){
		translate([STUD_RADIUS+WALL_THICKNESS,STUD_RADIUS+WALL_THICKNESS,height*PLATE_HEIGHT])
		for (y = [0:width-1]){
			for (x = [0:length-1]){
				translate ([x*BRICK_WIDTH,y*BRICK_WIDTH,-CORRECTION])
				difference(){
					cylinder(h=STUD_HEIGHT+CORRECTION, r=STUD_RADIUS);
					// Stud inner holes
					translate([0,0,-CORRECTION])
					cylinder(h=0.5*STUD_HEIGHT+CORRECTION,r=PIN_RADIUS);
				}
				// tech logo - disable this if your printer isn't capable of printing this small
				if ( length > width){
					translate([x*BRICK_WIDTH+0.8,y*BRICK_WIDTH-1.9,STUD_HEIGHT-CORRECTION])
					resize([1.2*1.7,2.2*1.7,0.254+CORRECTION])
					rotate(a=[0,0,90])
					import("tech.stl");
				}
				else {
					translate([x*BRICK_WIDTH-1.9,y*BRICK_WIDTH-0.8,STUD_HEIGHT-CORRECTION])
					resize([2.2*1.7,1.2*1.7,0.254+CORRECTION])
					import("tech.stl");				
				}				
				/* 
				//
				*/				
			}
		}
	}
	// Pins x
	if (width == 1 && length > 1) {	
			for (x = [1:length-1]){
				translate([x*BRICK_WIDTH,0.5*BRICK_WIDTH,0])
				cylinder(h=height*PLATE_HEIGHT-WALL_THICKNESS+CORRECTION,r=PIN_RADIUS);
				// Supports
				if (height > 1) {
				translate([x*BRICK_WIDTH-0.5*SUPPORT_THICKNESS,CORRECTION,STUD_HEIGHT])
				cube(size=[SUPPORT_THICKNESS,BRICK_WIDTH-2*CORRECTION,height*PLATE_HEIGHT-STUD_HEIGHT-WALL_THICKNESS+CORRECTION]);
			}
		}
	}
	// Pins y
	if (length == 1 && width > 1) {	
			for (y = [1:width-1]){
			translate([0.5*BRICK_WIDTH,y*BRICK_WIDTH,0])
			cylinder(h=height*PLATE_HEIGHT-WALL_THICKNESS+CORRECTION,r=PIN_RADIUS);
			// Supports
			if (height > 1) {
			translate([CORRECTION,y*BRICK_WIDTH-0.5*SUPPORT_THICKNESS,STUD_HEIGHT])
			cube(size=[BRICK_WIDTH-2*CORRECTION,SUPPORT_THICKNESS,height*PLATE_HEIGHT-STUD_HEIGHT-WALL_THICKNESS+CORRECTION]);}
			
		}
	}
	// Anti Studs
	if (width > 1 && length > 1){
		difference(){
			union(){
				for(y = [1:width-1]){
					for(x = [1:length-1]){
						// 
						translate([x*BRICK_WIDTH,y*BRICK_WIDTH,0])
						cylinder (h=height*PLATE_HEIGHT-WALL_THICKNESS+CORRECTION, r = ANTI_STUD_RADIUS);
						// 
						if (height > 1){
							// 
							if (x%2 == 0 && (length%2 == 0 || length%4 == 1 && x<length/2 || length%4 == 3 && x>length/2) || x%2 == 1 && (length%4 == 3 && x<length/2 || length%4 == 1 && x>length/2)) {
								translate([BRICK_WIDTH*x-0.5*SUPPORT_THICKNESS,y*BRICK_WIDTH-BRICK_WIDTH+WALL_THICKNESS-CORRECTION,STUD_HEIGHT])
								cube(size=[SUPPORT_THICKNESS,2*BRICK_WIDTH-2*WALL_THICKNESS,height*PLATE_HEIGHT-STUD_HEIGHT-WALL_THICKNESS+CORRECTION]);
							}
							// Supports y							
							if (y%2 == 0 && (width%2 == 0 || width%4 == 1 && y<width/2 || width%4 == 3 && y>width/2) || y%2 == 1 && (width%4 == 3 && y<width/2 || width%4 == 1 && y>width/2)) {
								translate([x*BRICK_WIDTH-BRICK_WIDTH+WALL_THICKNESS-CORRECTION,BRICK_WIDTH*y-0.5*SUPPORT_THICKNESS,STUD_HEIGHT])
								cube(size=[2*BRICK_WIDTH-2*WALL_THICKNESS,SUPPORT_THICKNESS,height*PLATE_HEIGHT-STUD_HEIGHT-WALL_THICKNESS+CORRECTION]);
							}
						}
					}
				}
			}
			union(){
				for(y = [1:width-1]){
					for(x = [1:length-1]){
						// 
						translate([x*BRICK_WIDTH,y*BRICK_WIDTH,-WALL_THICKNESS])
						cylinder (h=height*PLATE_HEIGHT, r = STUD_RADIUS);				
					}
				}
			}
		}		
	}
}
	