polyhedron(
  points=[ [10,10,0],[10,-10,0],[-10,-10,0],[-10,10,0], // the four points at base
           [0,0,10]  ],                                 // the apex point 
  faces=[ [0,1,4],[1,2,4],[2,3,4],[3,0,4],              // each triangle side
              [1,0,3],[2,1,3] ]                         // two triangles for square base
 );


module segmentA(x,y,z) {
  // x,y and z define the start positions of the segment's construction.
   polyhedron(
     points=[ 
        //0: middle bottom middle
        [2+x,2+y,0+z],
        //1: side middle 1
        [15+x,-5+y,0+z],
        //2: upwards tip
        [-10+x,-10+y,0+z],
        //3: side middle 2 (x1 = y2, x2=y1, to keep proportions)
        [-5+x,15+y,0+z],
        //4: upwards top point
        [2+x,2+y,10+z],
        //5: downwards tip
        [10+x,10+y,0+z]
      ],
     faces=[ 
      // connect the points given with a face. the order is important. the GSC geometry system won't properly render it
      // if the order is out of sync. luckily with only 3 points I could shuffle it around till it worked hehe.
      // But the overall idea is that there's an order for a face to be constructed in. so a face is valid if you connect A to B to C
      // but invalid if you do it in the wrong direction, like A to C to B.
        [5,1,4],
        [1,2,4],
        [2,3,4],
        [3,5,4],
        [5,3,0],
        [5,0,1],  // example -> [5,1,0] won't generate a face when rendering the model completely.
        [0,3,2],
        [0,2,1] 
      ]
   );
 }; 
 
 
 module segmentB(x,y,z) {
  // x,y and z define the start positions of this segment's construction.

  polyhedron(
     points=[ 
       [-3+x,-3+y,0+z],
       [15+x,-7+y,0+z],
       [-15+x,-15+y,0+z],
       [-7+x,15+y,0+z], 
       [-1+x,-1+y,10+z]
      ],                                
     faces=[ 
       [0,1,4],
       [1,2,4],
       [2,3,4],
       [3,0,4], 
       [0,3,2],
       [0,2,1] 
      ]                         
  );
 }; 




module EthereumLogo(x=0,y=0,z=0){
segmentA(0+x,0+y,0+z);
 
rotate([0,0,180]) 
segmentB(-10+x,-10+y,0+z);
}


EthereumLogo();

