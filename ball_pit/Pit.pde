class Pit {
  Ball ballz[];
  int siz;
  
  Pit(int s) {
    this.siz = s;
  }
  
  void show() {
    pushMatrix();
    translate(siz/2, siz/2, siz/2);
    noFill();
    stroke(1);
    box(siz);
    noStroke();
    fill(1);
    popMatrix();

    directionalLight(126, 126, 126, 0, 1, 0);
    ambientLight(100, 100, 100);
    for (int i = 0; i < ballz.length; i++) {
      ballz[i].fall();
      ballz[i].show();
      detectCollisions(i);
    }
    
  }
  
  void detectCollisions(int i) {
    for (int j = i+1; j < ballz.length; j++) {
      float d = dist(ballz[i].x, ballz[i].y, ballz[i].z, 
                     ballz[j].x, ballz[j].y, ballz[j].z);
      if (d < 100) {
        float dx = ballz[i].x - ballz[j].x;
        float dy = ballz[i].y - ballz[j].y;
        float f = 0.5; //sqrt(pow((ballz[i].xVel + ballz[j].xVel), 2) + 
                       //pow((ballz[i].yVel + ballz[j].yVel), 2));
        
        ballz[i].xVel = f*(dx/d);
        ballz[i].yVel = f*(dy/d);
        
        ballz[j].xVel = f*(-dx/d);
        ballz[j].yVel = f*(-dy/d);
      }
    }
  }
  
}
