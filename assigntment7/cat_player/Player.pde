class Player {
  // position
  float x, y, direction;
  float velocity = 10;
  float gravity = 3;
  
  // sprites
  int numFrames = 4;
  PImage[] walk_right = new PImage[numFrames];
  PImage[] walk_left = new PImage[numFrames];

  Player(float x, float y, float direction){
    // load sprite images
    for (int i = 0; i < walk_right.length; i++){
      String imageName = "cat_right_" + nf(i+1) + ".png";
      walk_right[i] = loadImage(imageName);
    }
    for (int i = 0; i < walk_left.length; i++){
      String imageName = "cat_left_" + nf(i+1) + ".png";
      walk_left[i] = loadImage(imageName);
    }
    
    // assign position
    this.x = x;
    this.y = y;
    this.direction = direction;
  }
  
  // display
  void display(PImage img, float x, float y){
    image(img, x, y);
  }

  // run right function ; toggled by right arrow
  void walkRight(){
    direction = 1;
    
    int frame = frameCount % numFrames;
    if (x >= 0 && x <= width - 57){
      x += velocity;
      display(walk_right[frame], x, y);
    }
    else if (x < 0){
      x = 0;
    }
    else if (x > width - 57){
      x = width - 57;
    }
  }
  
  // run left function ; toggled by left arrow
  void walkLeft(){
    direction = -1;
    
    int frame = frameCount % numFrames;
    if (x >= 0 && x <= width - 57){
      x -= velocity;
      display(walk_left[frame], x, y);
    }
    else if (x < 0){
      x = 0;
    }
    else if (x > width - 57){
      x = width - 57;
    }
  }
  
  // idle function ; key release
  void idle(){
    if (direction == 1){
      display(walk_right[0], x, y);
    }
    else{
      display(walk_left[0], x, y);
    }
  }

}
