class dog{
  float speed=3;
  float x;
  float y;
  PImage dogimg=loadImage("../A7_Assets/Screen_Layout/doggo.png");
  dog(float x, float y){
    this.x = x;
    this.y= y;
  }
  void show(){
   image(dogimg,this.x,this.y-2*dogimg.height-7);
   this.x-=speed;   
  }
  void update(){
    if(this.x<0){
      this.x=random(width, width+500);
    }
  }
}
