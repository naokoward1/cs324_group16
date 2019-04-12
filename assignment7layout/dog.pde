
class dog{
  float speed=3;
  float x=width;
  float y=height;

  PImage dogimg=loadImage("doggo.png");
  
  void show(){
  
   image(dogimg,x,y-2*dogimg.height-7);
    x-=speed;
 
   
  }
  void update(){
    if(x<0){
      x=width;
    }
  }
}
