//lotus from https://www.turbosquid.com/3d-models/free-max-model-flower/1116825

class scepter{
  PShape aBox;
  float x = 0;
  float y= 0;
  float z = 0;
  PShape scepterLotus;
  scepter(float z){
    this.z = z;
    scepterLotus = loadShape("lotus/lotus_OBJ_high/lotus_OBJ_high.obj");
    scepterLotus.setFill(color(234, 181, 206));
    aBox = createShape(BOX,2);
    aBox.setFill(color(181, 234, 209));
  }

  
  

void display(){
  translate(0, 0, this.z);
  pushMatrix();
  scale(-20);
  shape(scepterLotus);
  translate(0, -5);
  scale(0.6, 5);
  noStroke();
  shape(aBox);
  translate(x, y);
  scepterLotus.rotateY(PI/190);
  rotateZ(PI/2);
  popMatrix();
  x++;
  y++;
  this.z -= 10;
  if (this.z <= -6200){
    this.z = 0;
  }
}
}
