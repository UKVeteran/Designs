length = 40;
width  =20;
depth = 5;

cross =3;
leg_length =12;




echo(" length table is ", length, " mm");
 echo(" width table is ", width, " mm");
echo(" depth table top is ", depth, " mm");
 echo(" width table leg is ", cross, " mm");
 echo(" height table leg is ", leg_length, " mm");
 echo(" overall height table  is ", leg_length + depth, " mm");




table();


l = length/2;
w = width/2;


module table()
{


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
