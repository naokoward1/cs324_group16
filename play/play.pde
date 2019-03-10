Player Messi;
PImage socc;
void setup(){
  size(1000,1000,P3D);
  Messi=new Player(width/2,height/2,0);
  
}

void draw(){
  background(0);
  lights();
  directionalLight(135, 206, 250, -1, 1, 0);
  ambientLight(153, 80, 120);
  ambient(51, 26, 50);
  
  //camera(width/2.0, height/2.0, (height/2.0) / tan(PI*30.0 / 180.0), width/2.0, height/2.0, 0, 0, 1, 0);
 
  Messi.display();
  Messi.update();


  
}
 
  
