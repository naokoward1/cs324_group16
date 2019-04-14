PImage img;

class yarn{
  float x; float y; float speed;
  PImage img=loadImage("../A7_Assets/Screen_Layout/yarn.png");
  yarn(float x, float y, float speed){
    this.x = x;
    this.y = y;
    this.speed = speed;
  }
  void fall(){
    this.y= this.y+speed;
    if (this.y>height){
      this.y=random(-600,-50);
      this.x=random(30,width-30);
    }
  }  
  void show(){
    image(img, this.x, this.y);
    fall();
  }
}
