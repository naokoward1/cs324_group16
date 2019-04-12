Player cat;
boolean checkInput = false;

void setup(){
  size(800, 600);
  background(255, 255, 255);
  frameRate(10);
  
  cat = new Player(width / 2, (height - 67) - 87, 1);
}

void draw(){
  background(255, 255, 255);
  if (!checkInput){
    cat.idle();
  }
  
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == RIGHT) {
      checkInput = true;
      cat.walkRight();
    }
    else if (keyCode == LEFT) {
      checkInput = true;
      cat.walkLeft();
    }
  }
}

void keyReleased() {
  checkInput = false;

}
