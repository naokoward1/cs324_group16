class Player {
  // position
  float x, y, direction;
  float velocity = 10;
  float jumpVelocity = 5;
  float gravity = 5;
  PVector position;
  
  // check frame
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
    this.position = new PVector(this.x, this.y);
    this.direction = direction;
    
    // assign frame and state
    this.catState = 0;
    this.frame = 0;
  }
  
  // display
  void display(){
    if (position.y < (height - 67) - 87){
      position.y += gravity;
      if (direction == 1){
        position.x += jumpVelocity;
      }
      else {
        position.x -= jumpVelocity;
      }
    }
    
    if (catState == 0){
      if (direction == 1){
        image(walk_right[frame], position.x, position.y);
      }
      else {
        image(walk_left[frame], position.x, position.y);
      }
    }
    else if (catState == 0 && direction == -1){
      image(walk_left[frame], position.x, position.y);
    }
    else if (catState == 1){
      image(walk_right[frame], position.x, position.y);
    }
    else if (catState == 2){
      image(walk_left[frame], position.x, position.y);
    }
    else if (catState == 3){
      if (direction == 1){
        image(walk_right[frame], position.x, position.y);
      }
      else {
        image(walk_left[frame], position.x, position.y);
      }
    } 
  }
  
  void jump(){
    if (position.y == (height - 67) - 87){
      position.y -= 80;
      frame = 2;
    }
  }

  // run right function ; toggled by right arrow
  void walkRight(){
    direction = 1;
    
    frame = frameCount % numFrames;
    if (x >= 0 && x <= width - 57){
      position.x += velocity;
    }
    else if (x < 0){
      position.x = 0;
    }
    else if (x > width - 57){
      position.x = width - 57;
    }
  }
  
  // run left function ; toggled by left arrow
  void walkLeft(){
    direction = -1;
    
    frame = frameCount % numFrames;
    if (x >= 0 && x <= width - 57){
      position.x -= velocity;
    }
    else if (x < 0){
      position.x = 0;
    }
    else if (x > width - 57){
      position.x = width - 57;
    }
  }
  
  // idle function ; key release
  void idle(){
    frame = 0;
  }

}
