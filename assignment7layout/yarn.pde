PImage img;

class yarn{
  float x=random(30,width-30);
  float y=random(-600,-50);
  float speed=5;
  PImage img=loadImage("yarn.png");
  void fall(){
    y=y+speed;
    if (y>height){
      y=random(-600,-50);
      x=random(30,width-30);
    }
  }
    
  void show(){
    
    image(img,x,y);
    fall();
  }
  }
