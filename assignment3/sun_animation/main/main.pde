// pulse animation reference: http://vormplus.be/blog/article/an-introduction-to-processing-part-ii

Sun sun;
boolean grow = true;
float sun_w, sun_h;
float rotation = 0;

void setup(){
  size(800, 800);
  background(255, 255, 255);
  sun = new Sun();
  
  // store original dimensions of sun
  sun_w = sun.w_rays;
  sun_h = sun.h_rays;
}

void draw(){
  background(255, 255, 255);
  translate(-50, -50);
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
