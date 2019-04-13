PImage start;
PImage backgroundImage;
PImage win;
PImage gameOverImage;
PImage pausedImage;
String page = "startPage";
boolean paused = false;
Timer theTimer;
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
  gameOverImage = loadImage("../A7_Assets/Screen_Layout/gameover.png");
  gameOverImage.resize(width, height);
  background(start);
  theTimer = new Timer(3000);
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
  if (page=="startPage"){
    background(start);
    //reset score
    score = 0;
    //reset timer
    theTimer.timer = millis();
  }
  else if(page=="playPage"){
    if(timeOver(theTimer)){
      page = "gameOverPage";
    }
    else if (!paused){
      playInProgress();
    }
    else{
      playPaused();
    }
  }
  else if (page=="gameOverPage"){
    gameOverScreen();
  }
}

void keyPressed(){
  if (key == 32){
    if(page=="startPage"){
      page = "playPage";
    }
    else if(page=="playPage"){
      paused = !paused;
    }
    else if(page=="gameOverPage"){
      page = "startPage";
    }
  }
}

void playInProgress(){
  background(backgroundImage);
  myPoint.display();
  text("score: ", 30, 50);
  text(score, 120, 50);
  text("time: ", width-180, 50);
  int time = int((theTimer.interval - theTimer.totalTime) / 1000);
  String timeLeft = "00:" + nf(time, 2);
  text(timeLeft, width - 110, 50);
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
  theTimer.update();
}

void playPaused(){
  paused = true;
  background(pausedImage);
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
  //print(doggo.x, "is doggo.x\n", doggo.y, "is doggo.y\n", myPoint.x, "is myPoint.x\n",
    //myPoint.y, "is myPoint.y\n");
  if((abs(doggo.x - myPoint.x) < 10 && abs(doggo.y - myPoint.y) < 125)){
    return true;
  }
  return false;
}

void gameOverScreen(){
  background(gameOverImage);
  if(score>1000){
    text("You win!", 2*width/3, 50);
  }
  else{
    text("You lose :(", 2*width/3, 50);
  }
  text("score: ", 100, 50);
  text(score, 190, 50);
}

boolean timeOver(Timer theTimer){
  if(theTimer.update() > theTimer.interval){
    return true;
  }
  return false;
}
