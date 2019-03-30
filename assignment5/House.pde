class House {
  PShape mainHouse;                              // https://www.turbosquid.com/FullPreview/Index.cfm/ID/954695
  PShape puff;                                   // https://www.turbosquid.com/FullPreview/Index.cfm/ID/1340488
  float y = 0;

  House() {
    mainHouse = loadShape("CartoonHouse.obj");
    mainHouse.setFill(color(205, 92, 92));
    mainHouse.scale(5);
    mainHouse.rotateX(PI);
    mainHouse.rotateY(3*PI/2);
    puff = loadShape("cloud.obj");
    puff.setFill(color(225, 255, 255));
    puff.scale(0.2);
 
  }

  void display() {
    pushMatrix();
    translate(width/3, height/2);
    shape(mainHouse, -50, y);
    shape(puff, 10, y - 300);
    puff.rotateY(angle);
    popMatrix();
  }

  void levitate() {
    y += 1;
  }

  void descend() {
    y -= 1;
  }

  void smokeSpin() {
    if (angle < 0.1) {
      angle += 0.0005;
    } else {
      angle -= 0.0005;
    }
  }
  
}
