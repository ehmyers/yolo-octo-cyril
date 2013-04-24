class Ball { //Declaring class properties
  float x;
  float y;
  float z;
  color col;

  float xVel;
  float yVel;
  float zVel;
  float xAcc = 0;
  float yAcc = accel;
  float zAcc = accel;

  Ball(float xPos, float yPos, float zPos, color myColor) {
    x = xPos;
    y = yPos;
    z = zPos;
    col = myColor;
  }

  void fall() { //Equations to make the ball fall
    x += xVel;
    xVel += xAcc;
    y += yVel;
    yVel += yAcc;
    z += zVel;
    zVel += zAcc;
  }

  void show() { //...to show the ball
    fill(col);
    lights(); //Turns the lights on
    translate(100, 100, 0);
    sphere(50);
  }

  void xBounce() { //...and to bounce the ball
    xVel *= .9;
    xVel = -xVel;
  }

  void yBounce() { //...and to bounce the ball
    yVel *= .9;
    yVel = -yVel;
  }
  
  void zBounce() { //...and to bounce the ball
    zVel *= .9;
    zVel = -zVel;
  }
}






