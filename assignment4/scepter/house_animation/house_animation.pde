PImage sky;
House house;
boolean floating = true;
float angle = 0;

void setup(){
  size(800, 800, P3D);
  background(0, 0, 0);
  sky = loadImage("sky.png");
  background(sky);
  
  house = new House();
}

void draw(){
  background(sky);
  lights();
  directionalLight(135, 206, 250, -1, 1, 0);
  
  house.display();
  
  if (house.y <= 0) {
    floating = true;
  } else if (house.y > 100) {
    floating = false;
  }
  
  if (floating){
    house.levitate();
  } else{
    house.descend();
  }
  
  house.smokeSpin();
  
  
}
