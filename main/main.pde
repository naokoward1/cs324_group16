PImage sky;
Sun sun;
Cloud cloud1;
Cloud cloud2;
Cloud cloud3;
kite theKite;
Butterfly butterf;
boolean grow = true;
float sun_w, sun_h;
float rotation = 0;

void setup(){
  size(800, 800);
  background(255, 255, 255);
  sky = loadImage("sky.png");
  background(sky);
  
  // create objects
  sun = new Sun();
  cloud1 = new Cloud(150, 150);
  cloud2 = new Cloud(500, 300);
  cloud3 = new Cloud(600, 220);
  theKite = new kite(300, 150, 30, 70, PI/128, PI/4);
  butterf=new Butterfly(40,2*height/3,20,15,60);
  
  // store original dimensions of sun
  sun_w = sun.w_rays;
  sun_h = sun.h_rays;
}

void draw(){
  background(sky);
  
  // move sun to corner
  translate(-250, -250);
  sun.display();
  
  translate(250, 250);                   // undo translate, applies to sun only
  
  theKite.move();
  
  cloud1.display();
  cloud2.display();
  cloud3.display();
  
  //theKite.move();
  
  butterf.display();
  butterf.update();
  
  
  // check if sun has reached max size
  if (sun.w_rays > sun_w + 20){
    grow = false;
  }
  else if (sun.w_rays < sun_w){
    grow = true;
  }
 
  // pulse in or out based on sun size
  if (grow){
    sun.pulseOut();
  }
  else {
    sun.pulseIn();
  }
  sun.raySpin();
  
  cloud1.move();
  cloud2.move();
  cloud3.move();
 
}
