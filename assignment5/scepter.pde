class scepter{
  PShape pieta;
  PShape shape2;
  PShape aBox;
  float x = 0;
  float y= 0;
  float z = 0;
  float speed = 0;
  PShape scepterLotus;
  scepter(){
    this.speed = speed;
    scepterLotus = loadShape("lotus/lotus_OBJ_high/lotus_OBJ_high.obj");
    scepterLotus.setFill(color(234, 181, 206));
    aBox = createShape(BOX,2);
    aBox.setFill(color(181, 234, 209));
  }

  
  

void display(){
  //spotLight(220, 10, 10, 0, 0, 0, 0, 1, 0, 0, 2);
  //ambientLight(102, 100, 20);
  translate(0, 0, z);
  pushMatrix();
  scale(-20);
  shape(scepterLotus);
  translate(0, -5);
  scale(0.6, 5);
  noStroke();
  shape(aBox);
  translate(x, y);
  scepterLotus.rotateY(PI/190);
  //camera(0,0,0, mouseX, mouseY, 0, 0, 0);
  rotateZ(PI/2);
  popMatrix();
  x++;
  y++;
  z -= 10;
  this.speed -= 10;
}
}
