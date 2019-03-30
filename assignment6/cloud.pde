class cloud{
  float r;
  float x, y;
  boolean at_anc;
  float speed;
  cloud(float x, float y, float r, float speed){
    this.at_anc = false;
    this.x = x;
    this.y = y;
    this. r = r;
    this.speed = speed;
  }
  
  void display(){    
    drawSphere();
  }
  
  void drawSphere(){
    //fill(255);
    noStroke();
    pushMatrix();
    translate(this.x, this.y);
    sphere(this.r);
    translate(this.r, 0);
    sphere(this.r);
    translate(-this.r*1.5, this.r);
    sphere(this.r);
    translate(this.r, 0);
    sphere(this.r);
    translate(this.r, 0);
    sphere(this.r);
    popMatrix();
  }
  
  void updateColor(color col){
    fill(col);
  }
}
