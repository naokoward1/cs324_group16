PImage img1;
PImage img2;
int framecount=0;
yarn[] yarns=new yarn[5];
dog doggo;
Point myPoint;

void setup(){
  myPoint = new Point(400, 500, 10);
  surface.setResizable(true);
  img1=loadImage("background.png");  
  img2=loadImage("ground.png");
  surface.setSize(img1.width,img1.height);
  frameRate(60);
  
  for (int i=0; i<yarns.length; i++){
    yarns[i]=new yarn();
  }
  doggo=new dog();
}

void draw(){
  background(img1);
  myPoint.display();
  for (int i=0; i<5;i++){
    yarns[i].show();
  }
  image(img2,0,height-img2.height);
  if((millis()-framecount>=4000) && (doggo.x>0) ){
      doggo.show();    
  }
  if(doggo.x<0){
    doggo.update();
    framecount=millis();
  }
}

    
