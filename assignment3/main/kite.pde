//code for tail from 
//https://forum.processing.org/two/discussion/933/pshape-beziervertex-drawing-multiple-discreet-beziers
// xo, yo are the coordinates for where it first appears on the screen
// x, y are used to translate the kite
//xr, yr are the size of the kite
class kite {
  float xr, yr, xo, yo, x, y;
  PShape head, tail;
  float xSpeed = 1;
  float ySpeed = 1;
  float angleChange, angle;
  kite(float xo, float yo, float xr, float yr, float angleChange, float angle) {
    this.xo = xo;
    this.yo = yo;
    this.xr = xr;
    this.yr = yr;
    this.angleChange = angleChange;
    this.angle = angle;
    fill(#ee2d07);
    stroke(10);
    head=createShape(QUAD, 0, 0, -(this.xr/2), -3*this.yr/5, 0, - this.yr, this.xr / 2,  - (3*this.yr/5));
    stroke(#ece710);
    noFill();
    strokeWeight(2);
    tail = createShape();
    tail.beginShape();
    tail.vertex(0,0);
    tail.bezierVertex(0, this.yr / 5, this.xr / 4, 2 * this.yr / 5, 3 * this.xr / 8, this.yr / 2);
    tail.bezierVertex(3*this.xr/8, this.yr/2, this.xr / 4, 3 * this.yr/ 5, 0, this.yr);
    tail.endShape();
  }
  void display() {
    shapeMode(CORNER);
    shape(this.head);
    shape(this.tail);
  }
  void move(){
    shapeMode(CORNER);
    pushMatrix();
    if(abs(x) > 50){
      xSpeed *= -1;
    }
    x += xSpeed;
    if(abs(y) > 50){
      ySpeed *= -1 ;
    }
    y += ySpeed;
   // background(255);
    translate(this.x + this.xo, this.y + this.yo);
    translate(this.xo, this.yo);
    shape(this.tail);
    pushMatrix();
    rotate(angle);
    shape(this.head);
    popMatrix();
    angle += this.angleChange;
    if (abs(angle) > PI/4) {
      this.angleChange *= -1;
      angle += this.angleChange;
    }
    popMatrix();
  }
}
