//Bouncing BALLZ

// [it's ARRAY TIME!!!] (And declaring universal variables)
Ball ballz[];
Pit pit;
int numBallz = 5;
float accel = .07;

void setup() {
  colorMode(HSB); //Sets the color mode
  size(500, 500, P3D); //Sets the size of the screen
  noStroke(); //Eliminates lines
  noFill();
  camera(width/2.0, height/2.0, -800, 
         width/2.0, height/2.0, 0, 
         0, 1, 0);

  ballz = new Ball[numBallz];
  for (int i = 0; i<numBallz; i++) {
    ballz[i] = new Ball(random(width), random(height), random(height),
    color(random(255), random(200, 255), random(50, 200)));
  }
  
  pit = new Pit(500);
  pit.ballz = ballz;
}

//Calls the needed functions to create the ball
void draw() {
  background(200);
  pit.show();  
}

void keyPressed() {
  if(key==CODED) {
    if(keyCode==UP) {
      for(int i = 0; i<numBallz; i++) {
        ballz[i].xAcc = 0;
        ballz[i].yAcc = -accel;
        ballz[i].zAcc = 0;
      }
    }
    if(keyCode==DOWN) {
      for(int i = 0; i<numBallz; i++) {
        ballz[i].xAcc = 0;
        ballz[i].yAcc = accel;
        ballz[i].zAcc = 0;
      }
    }
    if(keyCode==LEFT) {
      for(int i = 0; i<numBallz; i++) {
        ballz[i].xAcc = accel;
        ballz[i].yAcc = 0;
        ballz[i].zAcc = 0;
      } 
    }
    if(keyCode==RIGHT) {
      for(int i = 0; i<numBallz; i++) {
        ballz[i].xAcc = -accel;
        ballz[i].yAcc = 0;
        ballz[i].zAcc = 0;
      } 
    }
  } else {
    if (key=='-') {
      for (int i = 0; i < ballz.length; i++) {
        ballz[i].setAcc(0, 0, accel);
      }
    } else if (key=='=') {
      for (int i = 0; i < ballz.length; i++) {
        ballz[i].setAcc(0, 0, -accel);
      }
    }
  }
}
