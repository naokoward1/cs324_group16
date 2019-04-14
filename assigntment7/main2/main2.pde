//Timer code from
//https://www.reddit.com/r/processing/comments/392l7n/how_to_make_a_pausable_timer/

PImage start;
PImage backgroundImage;
PImage win;
PImage gameOverImage;
PImage pausedImage;
PImage helpPage;
String page = "startPage";
boolean paused = false;
Timer theTimer;
int score = 0; 
Point myPoint;
yarn[] yarns=new yarn[20];
dog doggo;
int framecount = 0;
PImage ground;
Player cat;
boolean checkInput = false;
String beforePage;

void setup(){
  frameRate(30);
  cat = new Player(width/2, (height-67)-87, 1);
  myPoint = new Point(200, 500, 20);
  surface.setResizable(true);
  size(800, 600);
  start = loadImage("../A7_Assets/Screen_Layout/start.png");
  start.resize(width, height); 
  backgroundImage = loadImage("../A7_Assets/Screen_Layout/background.png");
  backgroundImage.resize(width,height);
  win = loadImage("../A7_Assets/Screen_Layout/win.png");
  pausedImage = loadImage("../A7_Assets/Screen_Layout/paused.png");
  pausedImage.resize(width, height);
  helpPage = loadImage("../A7_Assets/Screen_Layout/help.png");
  ground = loadImage("../A7_Assets/Screen_Layout/ground.png");
  gameOverImage = loadImage("../A7_Assets/Screen_Layout/gameover.png");
  gameOverImage.resize(width, height);
  helpPage.resize(width, height);
  win.resize(width,height);
  background(start);  
  theTimer = new Timer(10000);
  for (int i=0; i<yarns.length; i++){
    float x=random(30,width-30);
    float y=random(-600, -50);
    float speed=10;
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
  else if (page=="helpPage"){
    image(helpPage, 0, 0);
  }
}

void keyPressed(){
  if (keyCode == RIGHT) {
    checkInput = true;
    cat.catState = 1;
    cat.walkRight();
  }
  else if (keyCode == LEFT) {
    checkInput = true;
    cat.catState = 2;
    cat.walkLeft();
  }
  else if (keyCode == UP) {
    checkInput = true;
    cat.catState = 3;
    cat.jump();
  }
  else if (key == 32){
    if(page=="startPage"){
      page = "playPage";
    }
    else if(page=="playPage"){
      paused = !paused;
    }
    else if(page=="gameOverPage"){
      page = "startPage";
    }
    else if(page=="helpPage"){
      page = beforePage;
    }
  }
  else if(key==104){
    beforePage = page;
    page = "helpPage";
  }
}

void keyReleased() {
  checkInput = false;
  cat.catState = 0;
  cat.idle();
}
  

void playInProgress(){
  background(backgroundImage);
  cat.display();
  strokeWeight(10);
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
  if((abs(aYarn.x - cat.position.x) < 50) && abs(aYarn.y - cat.position.y) < 50){
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
  if((abs(doggo.x - cat.position.x) < 10 && abs(doggo.y - 155 - cat.position.y) < 5)){
    return true;
  }
  return false;
}

void gameOverScreen(){
  background(gameOverImage);
  if(score>=300){
    text("You win!", 2*width/3, 50);
  }
  else{
    text("You lose.", 2*width/3, 50);
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
