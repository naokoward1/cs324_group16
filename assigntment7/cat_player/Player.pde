class Player {
  // position
  float x, y, direction;
  float velocity = 8;
  float gravity = 3;
  int frame;
  int catState = 0;
  
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
    
    // assign frame and state
    this.catState = 0;
    this.frame = 0;
  }
  
  // display
  void display(){
    if (cat.catState == 0 && direction == 1){
      image(walk_right[frame], x, y);
    }
    else if (cat.catState == 0 && direction == -1){
      image(walk_left[frame], x, y);
    }
    else if (cat.catState == 1){
      image(walk_right[frame], x, y);
    }
    else if (cat.catState == 2){
      image(walk_left[frame], x, y);
    }
    
  }

  // run right function ; toggled by right arrow
  void walkRight(){
    direction = 1;
    
    frame = frameCount % numFrames;
    if (x >= 0 && x <= width - 57){
      x += velocity;
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
    
    frame = frameCount % numFrames;
    if (x >= 0 && x <= width - 57){
      x -= velocity;
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
    frame = 0;
  }

}
