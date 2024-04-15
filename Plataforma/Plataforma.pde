/**
 * Based on exemple "Arm" of Processing
 *
 * The angle of each segment is controlled with the mouseX and
 * mouseY position. The transformations applied to the first segment
 * are also applied to the second segment because they are inside
 * the same pushMatrix() and popMatrix() group.
 */

float x, y;
float angle1 = 0.0;
float angle2 = 0.0;
float segLengthX = 265;
float haste = 254;

void setup() {
  size(720, 720);
  strokeWeight(10);
  stroke(255, 160);

  x = width * 0.25;
  y = height * 0.5;
}

void draw() {
  background(0);

  angle1 = 0;
  angle2 = (mouseY/8 * -PI/180) - 90*PI/180;


  pushMatrix();
  segment(x, y, segLengthX, angle1);
  segment(segLengthX, 0, haste, angle2);
  popMatrix();


  pushMatrix();
  segment(x, y+haste*sin(angle2), segLengthX, angle1);
  segment(segLengthX, 0, haste, -angle2);
  popMatrix();
  noFill();
}

void segment(float x, float y, float segLength, float a) {
  translate(x, y);
  println(angle2*180/PI);
  rotate(a);
  line(0, 0, segLength, 0);
}
