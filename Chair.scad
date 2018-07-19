length = 20;
width  =25;
depth = 3.5;;


cross =3;
leg_length =20;





echo(" length table is ", length, " mm");
 echo(" width table is ", width, " mm");
echo(" depth table top is ", depth, " mm");
 echo(" width table leg is ", cross, " mm");
 echo(" height table leg is ", leg_length, " mm");
 echo(" overall height table  is ", leg_length + depth, " mm");



overall_height = 25;
leg_len =3;
width_vertical_bar = 3;
width_horizontal_bar =7;

overall_width = width;
thickness =cross;





union()
{
translate([0,0,leg_length+depth])
rotate([180,0,0])
table();
translate([0,-l+thickness,hoh + leg_len + leg_length +  depth-0.1 ])
rotate([90,0,0])
chair_back();

}





l = length/2;
w = width/2;

how = overall_width/2;
hoh = overall_height/2;
ll = -hoh - leg_len;
wvb = width_vertical_bar;
whb = width_horizontal_bar;
hwvb = wvb/2;









module table()
{

/*
   polyhedron command
  by pmoews
*/
polyhedron
       (points = [
                 [ -w,  l, 0],
                 [ -w, -l, 0],
                 [  w, -l, 0],
                 [  w,  l, 0],
                 [ -w,  l,  depth],
                 [ -w, -l,  depth],
                 [  w, -l,  depth],
                 [  w,  l,  depth],
                 [  w-cross, -l,  depth],
                 [  w-cross, cross-l,  depth],
                 [  w, cross-l,  depth],
                 [  w, -l,  leg_length + depth],
                 [  w-cross, -l,  leg_length + depth],
                 [  w-cross, cross-l,  leg_length + depth],
                 [  w, cross-l,  leg_length + depth],
                 [  w,  l-cross,  depth],
                 [  w-cross,  l-cross,  depth],
                 [  w-cross,  l,  depth],
                 [  w,  l,  leg_length + depth],
                 [  w,  l-cross,  leg_length + depth],
                 [  w-cross,  l-cross,  leg_length + depth],
                 [  w-cross,  l,  leg_length + depth],
                 [ cross-w,  l,  depth],
                 [ cross-w,  l-cross,  depth],
                 [ -w,  l-cross,  depth],
                 [ -w,  l,  leg_length + depth],
                 [ cross-w,  l,  leg_length + depth],
                 [ cross-w,  l-cross,  leg_length + depth],
                 [ -w,  l-cross,  leg_length + depth],
                 [ -w, cross-l,  depth],
                 [ cross-w, cross-l,  depth],
                 [ cross-w, -l,  depth],
                 [ -w, -l,  leg_length + depth],
                 [ -w, cross-l,  leg_length + depth],
                 [ cross-w, cross-l,  leg_length + depth],
                 [ cross-w, -l,  leg_length + depth],
                ],
           triangles = [
                 [   14,   10,   11],[    6,   11,   10],
                 [   11,    6,   12],[    8,   12,    6],
                 [   12,    8,   13],[    9,   13,    8],
                 [   13,    9,   14],[    9,   10,   14],
                 [   17,   21,   16],[   20,   16,   21],
                 [   16,   20,   15],[   19,   15,   20],
                 [   15,   19,    7],[   18,    7,   19],
                 [    7,   18,   17],[   18,   21,   17],
                 [   24,   28,   23],[   27,   23,   28],
                 [   23,   27,   22],[   26,   22,   27],
                 [   22,   26,    4],[   25,    4,   26],
                 [    4,   25,   24],[   25,   28,   24],
                 [   31,   35,   30],[   34,   30,   35],
                 [   30,   34,   29],[   33,   29,   34],
                 [   29,   33,    5],[   32,    5,   33],
                 [    5,   32,   31],[   32,   35,   31],
                 [   13,   14,   11],[   13,   11,   12],
                 [   20,   21,   18],[   20,   18,   19],
                 [   27,   28,   25],[   27,   25,   26],
                 [   34,   35,   32],[   34,   32,   33],
                 [    2,    3,    0],[    2,    0,    1],
                 [   16,    9,   30],[   16,   30,   23],
                 [   10,    2,    6],[    7,    3,   15],
                 [   10,   15,    3],[   10,    3,    2],
                 [    7,   17,    3],[   22,    4,    0],
                 [    0,    3,   17],[    0,   17,   22],
                 [    4,   24,    0],[   29,    5,    1],
                 [    1,    0,   24],[    1,   24,   29],
                 [    5,   31,    1],[    8,    6,    2],
                 [    2,    1,   31],[    2,   31,    8],
                 [   10,    9,   16],[   10,   16,   15],
                 [   24,   23,   30],[   24,   30,   29],
                 [    9,    8,   31],[    9,   31,   30],
                 [   17,   16,   23],[   17,   23,   22],
                 ]
      );

}



module chair_back()
{


/*
   polyhedron command by
   pmoews
*/
polyhedron
       (points = [
                 [ -how, -hoh + whb,   0.0],
                 [ -how + wvb, -hoh + whb,   0.0],
                 [  -hwvb, -hoh + whb,   0.0],
                 [   hwvb, -hoh + whb,   0.0],
                 [  how - wvb, -hoh + whb,   0.0],
                 [  how, -hoh + whb,   0.0],
                 [  how,  hoh - whb,   0.0],
                 [  how - wvb,  hoh - whb,   0.0],
                 [   hwvb,  hoh - whb,   0.0],
                 [  -hwvb,  hoh - whb,   0.0],
                 [ -how + wvb,  hoh - whb,   0.0],
                 [ -how,  hoh - whb,   0.0],
                 [  how,  hoh,   0.0],
                 [  how - wvb,  hoh,   0.0],
                 [   hwvb,  hoh,   0.0],
                 [  -hwvb,  hoh,   0.0],
                 [ -how + wvb,  hoh,   0.0],
                 [ -how,  hoh,   0.0],
                 [ -how, -hoh,   0.0],
                 [ -how + wvb, -hoh,   0.0],
                 [  -hwvb, -hoh,   0.0],
                 [   hwvb, -hoh,   0.0],
                 [  how - wvb, -hoh,   0.0],
                 [  how, -hoh,   0.0],
                 [  how, ll,   0.0],
                 [  how - wvb, ll,   0.0],
                 [ -how + wvb, ll,   0.0],
                 [ -how, ll,   0.0],
                 [ -how, -hoh + whb,   thickness],
                 [ -how + wvb, -hoh + whb,   thickness],
                 [  -hwvb, -hoh + whb,   thickness],
                 [   hwvb, -hoh + whb,   thickness],
                 [  how - wvb, -hoh + whb,   thickness],
                 [  how, -hoh + whb,   thickness],
                 [  how,  hoh - whb,   thickness],
                 [  how - wvb,  hoh - whb,   thickness],
                 [   hwvb,  hoh - whb,   thickness],
                 [  -hwvb,  hoh - whb,   thickness],
                 [ -how + wvb,  hoh - whb,   thickness],
                 [ -how,  hoh - whb,   thickness],
                 [  how,  hoh,   thickness],
                 [  how - wvb,  hoh,   thickness],
                 [   hwvb,  hoh,   thickness],
                 [  -hwvb,  hoh,   thickness],
                 [ -how + wvb,  hoh,   thickness],
                 [ -how,  hoh,   thickness],
                 [ -how, -hoh,   thickness],
                 [ -how + wvb, -hoh,   thickness],
                 [  -hwvb, -hoh,   thickness],
                 [   hwvb, -hoh,   thickness],
                 [  how - wvb, -hoh,   thickness],
                 [  how, -hoh,   thickness],
                 [  how, ll,   thickness],
                 [  how - wvb, ll,   thickness],
                 [ -how + wvb, ll,   thickness],
                 [ -how, ll,   thickness],
                ],
           triangles = [
                 [   11,    0,   10],[    1,   10,    0],
                 [   10,    1,   38],[   29,   38,    1],
                 [   38,   29,   39],[   28,   39,   29],
                 [   39,   28,   11],[   28,    0,   11],
                 [    9,    2,    8],[    3,    8,    2],
                 [    8,    3,   36],[   31,   36,    3],
                 [   36,   31,   37],[   30,   37,   31],
                 [   37,   30,    9],[   30,    2,    9],
                 [    7,    4,    6],[    5,    6,    4],
                 [    6,    5,   34],[   33,   34,    5],
                 [   34,   33,   35],[   32,   35,   33],
                 [   35,   32,    7],[   32,    4,    7],
                 [   18,   27,   19],[   26,   19,   27],
                 [   19,   26,   47],[   54,   47,   26],
                 [   47,   54,   46],[   55,   46,   54],
                 [   46,   55,   18],[   55,   27,   18],
                 [   22,   25,   23],[   24,   23,   25],
                 [   23,   24,   51],[   52,   51,   24],
                 [   51,   52,   50],[   53,   50,   52],
                 [   50,   53,   22],[   53,   25,   22],
                 [   24,   25,   53],[   24,   53,   52],
                 [   26,   27,   55],[   26,   55,   54],
                 [   16,   17,   11],[   16,   11,   10],
                 [   15,   16,   10],[   15,   10,    9],
                 [   14,   15,    9],[   14,    9,    8],
                 [   13,   14,    8],[   13,    8,    7],
                 [   12,   13,    7],[   12,    7,    6],
                 [   38,   39,   45],[   38,   45,   44],
                 [   37,   38,   44],[   37,   44,   43],
                 [   36,   37,   43],[   36,   43,   42],
                 [   35,   36,   42],[   35,   42,   41],
                 [   34,   35,   41],[   34,   41,   40],
                 [    1,    0,   18],[    1,   18,   19],
                 [    2,    1,   19],[    2,   19,   20],
                 [    3,    2,   20],[    3,   20,   21],
                 [    4,    3,   21],[    4,   21,   22],
                 [    5,    4,   22],[    5,   22,   23],
                 [   47,   46,   28],[   47,   28,   29],
                 [   48,   47,   29],[   48,   29,   30],
                 [   49,   48,   30],[   49,   30,   31],
                 [   50,   49,   31],[   50,   31,   32],
                 [   51,   50,   32],[   51,   32,   33],
                 [   45,   17,   16],[   45,   16,   44],
                 [   44,   16,   15],[   44,   15,   43],
                 [   43,   15,   14],[   43,   14,   42],
                 [   42,   14,   13],[   42,   13,   41],
                 [   41,   13,   12],[   41,   12,   40],
                 [   11,   17,   45],[   11,   45,   39],
                 [   12,    6,   34],[   12,   34,   40],
                 [    9,   10,   38],[    9,   38,   37],
                 [    7,    8,   36],[    7,   36,   35],
                 [   18,    0,   28],[   18,   28,   46],
                 [   23,   51,   33],[   23,   33,    5],
                 [   30,   29,    1],[   30,    1,    2],
                 [   32,   31,    3],[   32,    3,    4],
                 [   20,   19,   47],[   20,   47,   48],
                 [   22,   21,   49],[   22,   49,   50],
                 [   21,   20,   48],[   21,   48,   49],
                 ]                   );
}
