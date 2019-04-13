class Point{
  float x;
  float y;
  int strokeW;
  Point(float x, float y, int strokeW){
    this.x = x;
    this.y = y;
    this.strokeW = strokeW;
  }
  void display(){
    strokeWeight(this.strokeW);
    point(this.x, this.y);
  }
}
