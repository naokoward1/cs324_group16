class Sun {
  PShape sun_body, sun_rays;
  float x, y, w_rays, h_rays, w_body, h_body;
  float angle = 0.1;

  Sun() {
    sun_rays = loadShape("sun_rays.svg");
    sun_body = loadShape("sun_body.svg");
    x = width / 2;
    y = height / 2;
    w_rays = sun_rays.width;
    h_rays = sun_rays.height;
    w_body = sun_body.width;
    h_body = sun_body.height;
  }


  void display() {
    shapeMode(CENTER);
    shape(sun_rays, x, y, w_rays, h_rays);
    shape(sun_body, x, y, w_body, h_body);
  }

  void pulseOut() {
    w_rays += 1;
    h_rays += 1;
    w_body += 0.5;
    h_body += 0.5;
  }

  void pulseIn() {
    w_rays -= 1;
    h_rays -= 1;
    w_body -= 0.5;
    h_body -= 0.5;
  }

  void raySpin() {
    translate(x, y);
    sun_rays.rotate(angle);
    while (angle < TWO_PI){
      angle += 0.1;
    }
  }
  
}
