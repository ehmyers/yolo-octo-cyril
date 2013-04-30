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
      if (dist(ballz[i].x, ballz[i].y, ballz[i].z,
               ballz[j].x, ballz[j].y, ballz[j].z) < 100) {
        ballz[i].flipDirection();
        ballz[j].flipDirection();
      }
    }
  }
  
}
