class Player{
  float r;
  float x,y,z;
  float t,i;
  float radian,angle;
  PImage img;
  PShape soc;
  Player (float _x, float _y, float _z){
    this.x=_x;
    this.y=_y;
    this.z=_z;
    t=1;
    i=1;
    radian=0;
    angle=0;
    img=loadImage("soccer.jpg");
  }
  
  void display(){
     
     drawface();
     drawleftleg();
     drawrightleg();
     
     drawleftarm();
     drawrightarm();
     pointLight(50, 102, 180, x, y, z);
     drawbody();
     drawsoccer();
     
  }
  void drawbody(){
    pushMatrix();
    translate(x,y,z);
    rotateY(0.2*angle);
    rectMode(CENTER);
    noStroke();
    fill(#0E25F8);
    beginShape();
    vertex(-12.5, -25, 5);
    vertex(-12.5, -25, -5);
    vertex(-12.5,  25, -5);
    vertex(-12.5,  25, 5);
    vertex(12.5, 25, 5);
    vertex(12.5, -25, 5);
    vertex(12.5, -25, -5);
    vertex(12.5,  25, -5);
    vertex(-12.5,  25, -5);
    vertex(-12.5,  25, 5);
    vertex(12.5,  25, 5);
    vertex(12.5, -25, 5);
    vertex(-12.5, -25, 5);
    vertex(-12.5, -25, -5);
    vertex(-12.5, -25, -5);
    vertex(12.5, -25, -5);
    endShape(CLOSE);
    popMatrix();
     
}
  void drawface(){
    pushMatrix();
    translate(x,y-33.5,z);
    rotateY(0.2*angle);
    fill(#F6E3B6);
    noStroke();
    specular(100, 100,100);
    sphere(7.5);
    fill(#000000);
    ellipse(-4,0, 2.5, 2.5);
    ellipse(4, 0, 2.5, 2.5);
    popMatrix();
    pushMatrix();
    translate(x,y-33.5,z+7.5);
    rotateY(0.2*angle);

    fill(#000000);
    ellipse(-4,0, 2.5, 2.5);
    ellipse(4, 0, 2.5, 2.5);
    popMatrix();
  }
  void drawleftleg(){
    pushMatrix();
    
    translate(x-6.25,y+25,z);
    rotateY(0.2*angle);
    rectMode(CENTER);
    fill(#F65C27);
    rotateX(-angle);
    rect(0,25,8,60);
    popMatrix();
  }
  void drawrightleg(){
    pushMatrix();
    translate(x+6.25,y+25,z);
    rotateY(0.2*angle);
    rotateX(angle);
    rectMode(CENTER);
    rect(0,25,8,60);
    popMatrix();}

  void drawleftarm(){
    pushMatrix();
    translate(x-12.5,y-25,z);
    rotateY(0.2*angle);

    rectMode(CENTER);
    rotateX(angle);
    rect(-2.5,25,5,50);
    popMatrix();}
  
  void drawrightarm(){
    pushMatrix(); 
    translate(x+12.5,y-25,z);
    rotateY(angle);
    rectMode(CENTER);
    rotateX(0.3*(PI/3-angle));
    rect(2.5,25,5,50);
    popMatrix();}
    
  void drawsoccer(){
    pushMatrix(); 
    translate(x,y+70,z+30);
    rotateY(3*angle);
    rotateX(0.3*(PI/3-angle));
    fill(#FFFFFF  );
    soc=createShape(SPHERE,10);
    soc.setTexture(img);
    shape(soc);
    popMatrix();}

  void update(){
    if(y>7*height/12){
      y=7*height/12;
      t=-1;
      
      
    }

    if(y<4*height/12){
      y=4*height/12;
      t=1;
      
    }
    if(t==1){
      x=7*width/12+80*sin(radian/6);
      y+=2;
      z+=(500-z)*0.04;
      radian+=0.2;
    }
    if(t==-1){
      x=7*width/12+80*sin(radian/6);
      y-=2;
      z-=5;
      radian+=0.2;
    }
    
    if(angle>PI/3){
      angle=PI/3;
      i=-1;}
    if(angle<-PI/3){
      angle=-PI/3;
      i=1;}
    if(i==1){
      angle+=0.1;
    }
    if(i==-1){
      angle-=0.1;
    }
  }
}
  

    
