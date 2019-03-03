class Cloud{
  PShape cloudy;
  float x, y, w_cloud, h_cloud;

  Cloud(float x, float y) {
    cloudy = loadShape("cloud.svg");
    this.x = x;
    this.y = y;
    w_cloud = cloudy.width;
    h_cloud = cloudy.height;
  }

  void display() {
    shapeMode(CENTER);
    shape(cloudy, x, y, w_cloud, h_cloud);
  }
  
  void move(){
    this.x += 1;
    if (this.x == 900){
      this.x = 0;
    }
  }
  
}
