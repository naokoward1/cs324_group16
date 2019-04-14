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
  cat.display();
  
}

void keyPressed() {
  if (key == CODED) {
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
  }
}

void keyReleased() {
  checkInput = false;
  cat.catState = 0;
  cat.idle();

}
