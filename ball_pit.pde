//Bouncing BALLZ

// [it's ARRAY TIME!!!] (And declaring universal variables)
Ball ballz[];
int numBallz = 4;
float accel = .07;

void setup() {
  colorMode(HSB); //Sets the color mode
  size(500, 500, P3D); //Sets the size of the screen
  noStroke(); //Eliminates lines
  lights(); //Turns the lights on
  //translate(58, 48, 0);
  //sphere(28);

  ballz = new Ball[numBallz];
  for (int i = 0; i<numBallz; i++) {
    ballz[i] = new Ball(random(width), random(height), random(height),
    color(random(255), random(200, 255), random(50, 200)));
  }
}

//Calls the needed functions to create the ball
void draw() {
  background(150, 230, 255);
  for (int i = 0; i<numBallz; i++) {
    ballz[i].fall();
    
    if((ballz[i].x > 500 && ballz[i].xVel > 0) 
      || (ballz[i].x < 0 && ballz[i].xVel < 0)) {
      ballz[i].xBounce(); 
    }
    
    if((ballz[i].y > 500 && ballz[i].yVel > 0) 
      || (ballz[i].y < 0 && ballz[i].yVel < 0)) {
      ballz[i].yBounce(); 
    }
    
    ballz[i].show();
  }
}

void keyPressed() {
  if(key==CODED) {
    if(keyCode==UP) {
      for(int i = 0; i<numBallz; i++) {
        ballz[i].xAcc = 0;
        ballz[i].yAcc = -accel;
      }
    }
    if(keyCode==DOWN) {
      for(int i = 0; i<numBallz; i++) {
        ballz[i].xAcc = 0;
        ballz[i].yAcc = accel;
      }
    }
    if(keyCode==LEFT) {
      for(int i = 0; i<numBallz; i++) {
        ballz[i].xAcc = -accel;
        ballz[i].yAcc = 0;
      } 
    }
    if(keyCode==RIGHT) {
      for(int i = 0; i<numBallz; i++) {
        ballz[i].xAcc = accel;
        ballz[i].yAcc = 0;
      } 
    }
  }
}
