PImage sky;
PImage grass;
House house;
boolean floating = true;
float angle = 0;
PShape scepter;
PShape shape2;
PShape aBox;

scepter theScepter;
Player Messi;


void setup(){
  surface.setResizable(true);
  size(1000, 1000, P3D);
  background(0, 0, 0);
  sky = loadImage("sky.png");
  grass=loadImage("grass.jpg");
  sky.resize(width, height);
  sky.copy(sky,0,0,sky.width,sky.height/2,0,0,sky.width,sky.height/2);
  sky.copy(grass,0,0,sky.width,sky.height/2,0,sky.height/2,sky.width,sky.height/2);
  background(sky);
  
  house = new House();
  theScepter = new scepter(0);
  Messi=new Player(width/2,height/2,0);
}

void draw(){
  background(sky);
  lights();
  directionalLight(135, 206, 250, -1, 1, 0);
  camera(width/2.0, height/2.0, (height/2.0) / tan(PI*30.0 / 180.0), width/2.0, height/2.0, 0, 0, 1, 0);
  /*camera(0, 0, height * .86602,
    0, 0, mouseY,
    0, 1, 0);*/
  
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
  ambientLight(153, 80, 120);
  ambient(51, 26, 50);
  
  
 
  Messi.display();
  Messi.update();
  theScepter.display();
 

  
  
}
