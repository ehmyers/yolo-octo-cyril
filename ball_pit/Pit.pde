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
        float dz = ballz[i].z - ballz[j].z;
        
        float xF = ballz[i].xVel + ballz[j].xVel;
        float yF = ballz[i].yVel + ballz[j].yVel;
        float zF = ballz[i].zVel + ballz[j].zVel;
        float totalF = sqrt(pow(xF, 2) + pow(yF, 2) + pow(zF, 2));
        
        float f = totalF * 0.45;

        ballz[i].xVel = f*(dx/d);
        ballz[i].yVel = f*(dy/d);
        ballz[i].zVel = f*(dz/d);
        
        ballz[j].xVel = f*(-dx/d);
        ballz[j].yVel = f*(-dy/d);
        ballz[j].zVel = f*(-dz/d);
      }
    }
  }
  
}
