class Butterfly{
    float x,y;
    float radius,body_wid,body_hei,angle,scale,i,speed,radian,flap,flap_radian;
    
    Butterfly(float _x,float _y,float _radius,float _body_wid,float _body_hei){
      this.x=_x;
      this.y=_y;
      this.radius=_radius;
      this.body_wid=_body_wid;
      this.body_hei=_body_hei;
      
      angle=0;
      i=1;
      speed=5;
      scale=0.75;
      radian=0;
      flap=1;
      flap_radian=0;
    }
    
    void display(){
      pushMatrix();
      translate(x,y);
      rotate(angle);
      scale(scale);
      stroke(#070707);
      strokeWeight(3);
      noFill();
      arc(-20, -20, 40, 40, 5*PI/3, TWO_PI);
      arc(20, -20, 40, 40,PI , 4*PI/3);
      fill(#ee2d07);
      ellipse(-15, -40, 8, 8);
      ellipse(15, -40, 8, 8);
      ellipse(-15, 8, radius*flap, radius*flap);
      ellipse(-15, -8, radius*flap, radius*flap);
      ellipse(15, 9, radius*flap, radius*flap);
      ellipse(15, -8, radius*flap, radius*flap);
      fill(#ece710);
      ellipse(0, 0,body_wid,body_hei);
      popMatrix();
      

       
    }
    
    void update(){
      
      if(x>width){
        x=width;
        i=i+1;
        angle=0;
        }
      if(x<0){
        x=0;
        i=i+1;
        angle=0;
        scale=0.75;}
      if(i%2==0){ 
        x-=speed;
        y=2*height/3+100*sin(radian/6);
        angle=angle-0.005;
        scale-=0.005;
        radian+=0.2;}
      if(i%2==1){
        x+=speed;
        y=2*height/3+100*sin(radian/6);
        angle=angle+0.005;
        scale+=0.005;
        radian+=0.2;}
      
      flap=1.5*sin(flap_radian);
      flap_radian+=PI/6;
      if(flap_radian>PI){
        flap_radian=0;}
      }
     
}
      
      


        
        
        
        
      
    
