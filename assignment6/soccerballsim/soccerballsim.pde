Ball soccerBall;

void setup(){
  size(1000, 1000, P3D);
  background(255, 255, 255);
  frameRate(60);
  
  soccerBall = new Ball(50, 600, 10, 70, 30);
  
}

void draw(){
  pushMatrix();
  background(255, 255, 255);
  lights();
  soccerBall.display();
  soccerBall.kicked();
  
  popMatrix();
}
