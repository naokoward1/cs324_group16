PShape scepter;
PShape shape2;
PShape aBox;
float x = 0;
float y= 0;
float z = 0;
scepter theScepter;

void setup() {
  size(512, 512, P3D);
  theScepter = new scepter();
  background(0);
}

void draw() {
  //background(0xffffffff);
  background(0);
  //spotLight(51, 102, 126, 80, 20, 40, -1, 0, 0, PI/2, 2);
  camera(0, 0, height * .86602,
    0, 0, mouseY,
    0, 1, 0);
  theScepter.display();
}
