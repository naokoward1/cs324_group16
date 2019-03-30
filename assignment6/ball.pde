class Ball {
  // ball display
  PShape socBall;
  PImage soccerSkin;
  
  // physics variables
  float x, y, x0, y0;
  float v, vx, vy;
  float angle;
  float GRAVITY = 9.81;
  float r;
  float t = 0;
 
  // flags for loop control
  boolean fromLeft = true;
  boolean fromRight = false;
  
  Ball(float x, float y, float v, float angle, float r){
    // store initial x and y values
    this.x0 = x;
    this.y0 = y;
    
    // arbitrary values
    this.vx = v * cos(radians(angle));
    this.vy = v * sin(radians(angle));
    this.angle = angle;
    this.r = r;
    
    // dynamic coordinates
    this.x = x;
    this.y = y;
    
    // create soccer ball shape
    noStroke();
    soccerSkin = loadImage("soccer.jpg");
    socBall = createShape(SPHERE, r);
    socBall.setTexture(soccerSkin);
  }
  
  // display ball
  void display(){
    pushMatrix();
    translate(x, y,0);
    shape(socBall);
    popMatrix();
  }

  // apply forces necessary for parabolic motion
  void kicked(){
    // increment time
    t += 0.02;
    
    // update x and y according to projctile motion equations
    if (fromLeft){
      x += vx * t;
      y -= (vy * t) - (0.5 * GRAVITY * sq(t));                              // negative because of inverted y-axis
    }
   
    if (fromRight){
      x -= vx * t;                                                          // negative x direction
      y -= (vy * t) - (0.5 * GRAVITY * sq(t));                              // negative because of inverted y-axis
    }
   
    // loop simulation back and forth when ball hits ground 
    if (y > y0 && fromLeft){
      // reset values
      y = y0;
      t = 0;
      
      // set flags
      fromLeft = false;
      fromRight = true;
    } 
    
    if (y > y0 && fromRight){
      // reset values
      y = y0;
      t = 0;
      
      // set flags
      fromLeft = true;
      fromRight = false;  
    }   
  }
  
}
