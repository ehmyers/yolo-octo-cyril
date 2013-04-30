class Pit {
  Ball ballz[];
  int siz;
  
  Pit(int s) {
    this.siz = s;
  }
  
  void show() {
    pushMatrix();
    translate(siz/2, siz/2, 0);
    noFill();
    stroke(1);
    box(siz);
    noStroke();
    fill(1);
    popMatrix();
    
    //lights();
    for (int i = 0; i < ballz.length; i++) {
      ballz[i].fall();
      ballz[i].show();
    }
  }
}
