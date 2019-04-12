PImage start;
PImage backgroundImage;
PImage win;
PImage gameOver;
PImage pausedImage;
String page = "startPage";
boolean paused = false;
int pauseStart;
int pauseEnd;
Timer theTimer;
boolean started = false;
int score = 0; 
Point[] points;
Point myPoint;
yarn[] yarns=new yarn[20];
dog doggo;
int framecount = 0;
PImage ground;

void setup(){
  points = new Point[30];
  myPoint = new Point(200, 500, 20);
  for(int i=0; i < points.length; i++){
    points[i] = new Point(random(width), random(height), 10);
  }
  surface.setResizable(true);
  size(800, 600);
  start = loadImage("../A7_Assets/Screen_Layout/start.png");
  start.resize(width, height); 
  backgroundImage = loadImage("../A7_Assets/Screen_Layout/background.png");
  backgroundImage.resize(width,height);
  win = loadImage("../A7_Assets/Screen_Layout/win.png");
  pausedImage = loadImage("../A7_Assets/Screen_Layout/paused.png");
  pausedImage.resize(width, height);
  ground = loadImage("../A7_Assets/Screen_Layout/ground.png");
  gameOver = loadImage("../A7_Assets/Screen_Layout/gameover.png");
  gameOver.resize(width, height);
  background(start);
  theTimer = new Timer(10000);
  for (int i=0; i<yarns.length; i++){
    float x=random(30,width-30);
    float y=random(-600, -50);
    float speed=5;
    yarns[i]=new yarn(x, y, speed);
  }
  doggo=new dog(width, height);
  textSize(26);
}

void draw(){
  println(page);
  if (page=="startPage"){
    background(start);
  }
  else if(paused){
    image(pausedImage, 0, 0);
  }
  else if (page=="playPage"){
    if(!started){
      theTimer.timer = millis();
      started = true;
    }
    playPage();
  }
  theTimer.update();
  if(theTimer.update() > theTimer.interval){
    theTimer.elapsedTime = 0;
    gameOver();
  }
  //println(score);
}

void keyPressed(){
  if (key == 32){
    if(page=="startPage"){
      page = "playPage";
    }
    else if(page=="over"){
      theTimer.totalTime = 0;
      page="startPage";
    }
    else if(paused){
      paused = false;
    }
    else if(!paused){
      theTimer.pauseTimer();
      paused = true;
    }
  }
}

void playPage(){
  background(backgroundImage);
  myPoint.display();
  text("score: ", 30, 50);
  text(score, 120, 50);
  text("time: ", width-180, 50);
  float time = theTimer.segmentTime;
  text(time, width - 120, 50);
  for (int i=0; i<5;i++){
    yarns[i].show();
  }
  image(ground,0,height-ground.height);
  if((millis()-framecount>=4000) && (doggo.x>0) ){
      doggo.show();    
  }
  if(doggo.x<0){
    doggo.update();
    framecount=millis();
  }
  for(yarn aYarn: yarns){
    if(collectYarn(aYarn)){
      score += 100;
    }
  }
  if(runDog()){
    score -= 200;
    doggo.x = random(width, width+500);
  }
}
  /*
  else if(runDog){
    score -= 200;
  }  
  */

void gameOver(){
  image(gameOver, 0, 0);
}


boolean collectYarn(yarn aYarn){
  if((abs(aYarn.x - myPoint.x) < 50) && abs(aYarn.y - myPoint.y) < 50){
    aYarn.y = random(-600, -50);
    aYarn.x = random(width);
    return true;
  }
  if(aYarn.y > height){
    aYarn.y = 0;
  }
  return false;
}
boolean runDog(){
  print(doggo.x, "is doggo.x\n", doggo.y, "is doggo.y\n", myPoint.x, "is myPoint.x\n",
    myPoint.y, "is myPoint.y\n");
  if((abs(doggo.x - myPoint.x) < 10 && abs(doggo.y - myPoint.y) < 125)){
    return true;
  }
  return false;
}
