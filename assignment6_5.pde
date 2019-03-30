cloud theCloud;
cloud theCloud2;
float anc_x = 250;
float anc_y = 100;
int numClouds = 7;
cloud[] theClouds;
cloud curCloud;
int index = 0;
int x = 0;
float xPos; float yPos; float rad; float speed;

void setup(){
  size(1000,1000, P3D);
  theClouds = new cloud[numClouds];
  //theCloud = new cloud(0, 0, 50);
  //theCloud2 = new cloud(width/4, height/4, 20);
  for(x=0; x < numClouds; x++){
    xPos = random(-200, 200);
    yPos = random(-100, 100);
    rad = random(10, 25);
    speed = random(0.9, 1.8);
    curCloud = new cloud(xPos, yPos, rad, speed);
    theClouds[index++] = curCloud;
  }
}

void draw(){
  background(20);
  translate(anc_x, anc_y);
  strokeWeight(10);
  point(0, 0);
  for(cloud aCloud : theClouds){
    if(num_neighbors(aCloud) > 6){
      aCloud.updateColor(color(10));
    }
    else if(num_neighbors(aCloud) > 5){
      aCloud.updateColor(color(50));
    }
    else if(num_neighbors(aCloud) > 3){
      aCloud.updateColor(color(100));
    }
    if((abs(aCloud.x - anc_x) < 1 && abs(aCloud.y - anc_y) < 1)){
      if(!aCloud.at_anc){
        aCloud.r *= 2;
      }
      aCloud.at_anc = true;
    }
    if(!aCloud.at_anc){
      if (aCloud.x > anc_x){
        aCloud.x -= aCloud.speed;
      }
      else if (aCloud. x < anc_x){
        aCloud.x += aCloud.speed;
      }
 
      if (aCloud.y > anc_y){
        aCloud.y -= aCloud.speed*0.5;
      }
      else if (aCloud.y < anc_y){
        aCloud.y+= aCloud.speed*0.5;
      }
    }
    aCloud.display();
  }
  }

int num_neighbors(cloud aCloud){
  int total_num = 0;
  for(cloud neighborCloud : theClouds){
    if(sqrt(sq(aCloud.x - neighborCloud.x)+sq(aCloud.y-neighborCloud.y)) < 9){
      total_num += 1;
    }
  }
  return total_num;
}

void mousePressed(){
  xPos = random(-200, 200);
  yPos = random(-100, 100);
  rad = random(10, 25);
  speed = random(0.9, 1.8);
  curCloud = new cloud(xPos, yPos, rad, speed);
  theClouds = (cloud[]) append(theClouds, curCloud);
}
