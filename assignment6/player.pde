class player{
  float r;
  float x,y,z;
  float t,i,m,n;
  float angle;
  float fromleft;
  PImage img;
  

  player (float _x, float _y, float _z){
    this.x=_x;
    this.y=_y;
    this.z=_z;
    t=1;
    i=1;
    angle=0;
    m=1;
    n=1;
    fromleft=1;
    img=loadImage("cloth.jpg");
    img.resize(70,70);
  }
    
  void run(float i,float soccer_x){
    display();
    update(i,soccer_x);
  
  }
  void display(){
     drawface();
     drawleftleg();
     drawrightleg();
     drawleftarm();
     drawrightarm();
     drawbody();
   
     
  }

 void update(float i, float soccer_x){
    
     x+=0.1*(soccer_x-x)/i;
     z+=-0.1*z/i;
     if(y<450){
       y=450;
       n=1;}
     if(n==1){
     y+=0.01*i*i;}
     if(y>600){
       y=600;
       n=-1;}
     if(n==-1){
       y-=0.01*i*i;}
     if(soccer_x-x<0){
       fromleft=-1;}
     else{
       fromleft=1;}
     if(angle>PI/3){
      angle=PI/3;
      m=-1;}
    if(angle<-PI/3){
      angle=-PI/3;
      m=1;}
    if(m==1){
      angle+=0.1;
    }
    if(m==-1){
      angle-=0.1;
    }
 }
   
    
  
  void drawbody(){
    pushMatrix();
    translate(x,y,z);
    rotateY(0.2*angle+PI/6*fromleft);
    rectMode(CENTER);
    noStroke();
    fill(#F65C27); 
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
    beginShape();
    texture(img);
    vertex(-12.5, 25, 5,20,10);
    vertex(-12.5, -25, 5,20,60);
    vertex(12.5, -25, 5,45,60);
    vertex(12.5, 25, 5,45,10);
    endShape();
    popMatrix();  
}
void drawface(){
    pushMatrix();
    translate(x,y-33.5,z);
    rotateY(0.2*angle+PI/6*fromleft);
    fill(#F6E3B6);
    noStroke();
    sphere(8);
    fill(#000000);
    ellipse(-1,0, 2.5, 2.5);
    ellipse(1, 0, 2.5, 2.5);
    popMatrix();
    pushMatrix();
    translate(x,y-33.5,z+7.5);
    //rotateY(0.2*angle+PI/12*fromleft);

    fill(#000000);
    ellipse(-4,0, 2.5, 2.5);
    ellipse(4, 0, 2.5, 2.5);
    popMatrix();
  }
  void drawleftleg(){
    pushMatrix();
    
    translate(x-6.25,y+25,z);
    rotateY(0.2*angle+PI/6*fromleft);
    rectMode(CENTER);
    
    rotateX(-angle);
    fill(#000000);
    rect(0,25,8,60);
    
    popMatrix();
  }
  void drawrightleg(){
    pushMatrix();
    translate(x+6.25,y+25,z);
    rotateY(0.2*angle+PI/6*fromleft);
    rotateX(angle);
    rectMode(CENTER);
    rect(0,25,8,60);
    popMatrix();}

  void drawleftarm(){
    pushMatrix();
    translate(x-12.5,y-25,z);
    rotateY(0.2*angle+PI/6*fromleft);

    rectMode(CENTER);
    rotateX(angle);
    fill(#F65C27);
    rect(-2.5,25,5,50);
    popMatrix();}
  
  void drawrightarm(){
    pushMatrix(); 
    translate(x+12.5,y-25,z);
    rotateY(angle+PI/6*fromleft);
    rectMode(CENTER);
    rotateX(0.3*(PI/3-angle));
    fill(#F65C27);
    rect(2.5,25,5,50);
    popMatrix();}

}
 
