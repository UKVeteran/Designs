function sphere_translation(cube_dimensions, radius) = [
  0, 0, cube_dimensions[2] + radius
];

module sphere_on_cube(cube_dimensions, sphere_radius) {
  translate([-cube_dimensions[0] / 2, -cube_dimensions[1] / 2, 0]) {
    cube(cube_dimensions);
  }
  translate(sphere_translation(cube_dimensions, sphere_radius)) {
    sphere(sphere_radius, $fn=30);
  }
}

cube_dimensions = [5, 5, 15];

sphere_on_cube(cube_dimensions, 1);

sphere_points = [
  [0, 0, 0],
  [1, 1, 0],
  [1, 2, 0],
  [0, 3, 0]
];

hull() {
  for (point=sphere_points) {
    translate(point) sphere(1);
  }
}

module piecewise_join(points) {
  for (n=[1:len(points) - 2]) {
    hull() {
      translate(points[n-1]) children(0);
      translate(points[n]) children(0);
    }
    hull() {
      translate(points[n+1]) children(0);
      translate(points[n]) children(0);
    }
  }
}

sphere_points = [
  [0, 0, 0],
  [1, 1, 0],
  [1, 2, 0],
  [0, 3, 0]
];

piecewise_join(sphere_points) sphere(0.2);

control_points = [
  // this is the start of the curve
  [0, 0, 0],
  // this point influences the curve, but the curve does not 
  // pass through it
  [3, 4, 5],
  // this point influences the curve, but the curve does not
  // pass through it
  [6, 12, 10],
  // this is the end of the curve.
  [9, 8, 15],
];

module draw_points(points) {
  for (point = points) {
    translate(point) children(0);
  }
}

draw_points(control_points) sphere(1);

halfway_point = [
  // find the x-coordinate at t=0.5, using the x-values of 
  // the control points
  bezier_coordinate(0.5, [0, 3, 6, 9]),
  // find the y-coordinate at t=0.5, using the y-values of
  // the control points
  bezier_coordinate(0.5, [0, 4, 12, 8]),
  // find the z-coordinate at t=0.5, using the z-values of
  // the control points
  bezier_coordinate(0.5, [0, 5, 10, 15]),
];

function bezier_coordinate(t, weights) = (
  (weights[0] * 1 * pow((1 - t), (3 - 0)) * pow(t, 0)) +
  (weights[1] * 3 * pow((1 - t), (3 - 1)) * pow(t, 1)) +
  (weights[2] * 3 * pow((1 - t), (3 - 2)) * pow(t, 2)) +
  (weights[3] * 1 * pow((1 - t), (3 - 3)) * pow(t, 3))
);

function bezier_point(t, control_points) = 
  [
    bezier_coordinate(t, [
      control_points[0][0],
      control_points[1][0],
      control_points[2][0],
      control_points[3][0]
    ]),
    bezier_coordinate(t, [
      control_points[0][1],
      control_points[1][1],
      control_points[2][1],
      control_points[3][1]
    ]),
    bezier_coordinate(t, [
      control_points[0][2],
      control_points[1][2],
      control_points[2][2],
      control_points[3][2]
    ])
  ];

function bezier_curve_points(control_points, num_points) =
  [for (t=[0:num_points]) bezier_point(
    t * (1 / num_points), control_points
  )];

module draw_points(points) {
  for (point = points) {
    translate(point) children(0);
  }
}
module piecewise_join(points) {
  for (n=[1:len(points) - 2]) {
    hull() {
      translate(points[n-1]) children(0);
      translate(points[n]) children(0);
    }
    hull() {
      translate(points[n+1]) children(0);
      translate(points[n]) children(0);
    }
  }
}

control_points = [
  [0, 0, 0], // this is the start of the curve
  [3, 4, 5], // this point influences the curve, but the curve does not pass through it
  [6, 12, 10], // this point influences the curve, but the curve does not pass through it
  [9, 8, 15], // this is the end of the curve.
];

draw_points(control_points) sphere(1);
piecewise_join(bezier_curve_points(control_points, 10)) sphere(0.2);



use <./lib/bézier.scad>;

LEAF_EDGE_CONTROL_POINTS = [
  [0, 0, 0],
  [2, 20, 0],
  [24, 80, 60],
  [16, 40, 40],
  [0, 60, 75]
];

LEAF_CENTER_CONTROL_POINTS = [
  [0, 0, 0],
  [0, 20, 0],
  [0, 80, 10],
  [0, 40, 55],
  [0, 60, 75]
];

SAMPLES = 20;

module leaf_half() {
  // render the outside edge of the leaf
  bezier(LEAF_EDGE_CONTROL_POINTS, SAMPLES) sphere(1);
  // get the [x, y, z] coordinates of the points that 
  // make up the curve
  edge_points = bezierPoints(LEAF_EDGE_CONTROL_POINTS, SAMPLES);
  // get the [x, y, z] coordinates of the points that make up the 
  // center line
  center_points = bezierPoints(LEAF_CENTER_CONTROL_POINTS, SAMPLES);
  // We want the veins to slant up from the center to the outside of 
  // the leaf, so we match the point 3 on the center line with point
  // 6 on the outside edge, point 4 in the center with 7 on the edge,
  // and so on until we get to the last point on the edge
  for (i=[6:SAMPLES]) {
    ep = edge_points[i];
    cp = center_points[i - 3];
    // We use 3 points to define the curve for the vein. The first
    // point is a point on the edge, the last point is on the
    // center, and the middle point is halfway between and skewed a
    // little toward the bottom and "underside" of the leaf, to give
    // the vein a nice curve.
    vein_points = [
      ep,
      [
        ((ep[0] + cp[0]) / 2),
        ((ep[1] + cp[1]) / 2),
        ((ep[2] + cp[2]) / 2) - 5
      ],
      cp
    ];
    bezier(vein_points, SAMPLES) sphere(1.2);
  }
}


// to render the whole leaf, we render half the leaf, mirror it,
// and render the middle line just once.
module leaf() {
  leaf_half();
  mirror([1, 0, 0]) leaf_half();
  bezier(LEAF_CENTER_CONTROL_POINTS, SAMPLES) sphere(2);
}
leaf();

LEAVES = 12;
for (i=[0:360 / LEAVES: 360]) {
  rotate([0, 0, i]) leaf();
}