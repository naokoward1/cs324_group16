
// pulse animation reference: http://vormplus.be/blog/article/an-introduction-to-processing-part-ii

Sun sun;
kite theKite;
Butterfly butterf;
boolean grow = true;
float sun_w, sun_h;
float rotation = 0;

void setup(){
  size(800, 800);
  background(255, 255, 255);
  butterf=new Butterfly(40,2*height/3,20,15,60);
  sun = new Sun();
  theKite = new kite(300, 150, 30, 70, PI/128, PI/4);
  // store original dimensions of sun
  sun_w = sun.w_rays;
  sun_h = sun.h_rays;
}

void draw(){
  background(255, 255, 255);
  theKite.move();
  butterf.display();
  butterf.update();
  translate(-250, -250);
  sun.display();
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
 
}
